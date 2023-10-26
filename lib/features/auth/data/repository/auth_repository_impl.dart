import 'package:mobile/core/network/rest_api_client.dart';
import 'package:mobile/features/auth/data/models/auth_payload_model.dart';
import 'package:mobile/features/auth/data/models/auth_response_model.dart';
import 'package:mobile/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImplementation extends AuthRepository {
  AuthRepositoryImplementation({
    required this.restAPIClient,
  });

  final RestAPIClient restAPIClient;

  @override
  Future<PhoneNumberSignupResponse> onProceedWithPhoneNumber(
      PostPhoneNumberRequestModel request) async {
    return await restAPIClient.onProceedWithPhoneNumber(request);
  }

  @override
  Future<VerifyOtpResponseModel> verifyOTP(
      VerifyOtpRequestModel request) async {
    return await restAPIClient.verifyOTP(request);
  }

  @override
  Future<LoginResponse> login(
      LoginRequestModel request, bool shouldLogoutSession) async {
    return await restAPIClient.login(request, shouldLogoutSession);
  }

  @override
  Future<LoginResponse> setPin(LoginRequestModel request) async {
    return await restAPIClient.setPin(request);
  }

  @override
  Future<LoginResponse> resetPin(LoginRequestModel request) async {
    return await restAPIClient.resetPin(request);
  }

  @override
  Future onProceedForgotPin(PostPhoneNumberRequestModel request) async {
    return await restAPIClient.onProceedForgotPin(request);
  }

  @override
  Future<LoginResponse> googleLogin(GoogleSigninRequestModel request) async {
    return await restAPIClient.googleLogin(request);
  }
  
  @override
  Future<VerifyOtpResponseModel> resendOtp(PostPhoneNumberRequestModel request) async {
    return await restAPIClient.resendOtp(request);
  }

}
