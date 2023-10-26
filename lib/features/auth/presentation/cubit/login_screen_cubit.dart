import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobile/core/di/injector.dart';
import 'package:mobile/data/sources/local/preferences/app_preferences.dart';
import 'package:mobile/features/auth/data/models/auth_payload_model.dart';
import 'package:mobile/features/auth/data/models/auth_response_model.dart';
import 'package:mobile/features/auth/domain/repository/auth_repository.dart';
import 'package:mobile/features/auth/presentation/states/login_screen_states.dart';

class LoginScreenCubit extends Cubit<LoginScreenStates> {
  LoginScreenCubit({
    required this.authRepository,
    required this.googleSignIn,
  }) : super(const LoginScreenStates.initial());

  final AuthRepository authRepository;
  final GoogleSignIn googleSignIn;

  void onProceedWithPhoneNumber(PostPhoneNumberRequestModel request) async {
    emit(const LoginScreenStates.loading());
    try {
      final PhoneNumberSignupResponse response =
          await authRepository.onProceedWithPhoneNumber(request);
      emit(LoginScreenStates.onPhoneNumberValidated(response));
    } on DioException catch (e) {
      emit(LoginScreenStates.onError(e.message.toString()));
    }
  }

  void onProceedForgotPin(PostPhoneNumberRequestModel request) async {
    emit(const LoginScreenStates.loading());
    try {
      await authRepository.onProceedForgotPin(request);
      emit(const LoginScreenStates.onSuccessForgotPin());
    } on DioException catch (e) {
      emit(LoginScreenStates.onError(e.message.toString()));
    }
  }

  void googleLogin() async {
    try {
      GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account != null) {
        GoogleSignInAuthentication authentication =
            await account.authentication;

        final GoogleSigninRequestModel payload = GoogleSigninRequestModel(
            authentication.accessToken.toString(),
            authentication.idToken.toString());
        final LoginResponse response =
            await authRepository.googleLogin(payload);
        final appPreferences = Injector.resolve<AppPreferences>();
        // Save token
        appPreferences.saveUserAccessToken(response.authTokens?.accessToken);
        appPreferences.saveUserRefreshToken(response.authTokens?.refreshToken);
        emit(LoginScreenStates.onSuccessGoogleSignIn(response));
      }else{
        emit(LoginScreenStates.onError("Not able to login"));
      }
    } on DioException catch (e) {
      emit(LoginScreenStates.onError(e.message.toString()));
    }
  }
}
