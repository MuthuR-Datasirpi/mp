import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/di/injector.dart';
import 'package:mobile/data/sources/local/preferences/app_preferences.dart';
import 'package:mobile/features/auth/data/models/auth_payload_model.dart';
import 'package:mobile/features/auth/data/models/auth_response_model.dart';
import 'package:mobile/features/auth/domain/repository/auth_repository.dart';
import 'package:mobile/features/auth/presentation/states/pin_screen_states.dart';

class PinScreenCubit extends Cubit<PinScreenStates> {
  PinScreenCubit({
    required this.authRepository,
  }) : super(const PinScreenStates.initial());

  final AuthRepository authRepository;

  void login(LoginRequestModel request, bool shouldLogoutSession) async {
    emit(const PinScreenStates.loading());
    try {
      final LoginResponse response =
          await authRepository.login(request, shouldLogoutSession);
      final appPreferences = Injector.resolve<AppPreferences>();
      // Saving token local
      appPreferences.saveUserAccessToken(response.authTokens?.accessToken);
      appPreferences.saveUserRefreshToken(response.authTokens?.refreshToken);
      emit(PinScreenStates.onVerifiedPin(response.authTokens));
    } on DioException catch (e) {
      final statusCode = (e.error as int);
      // Invalid OTP Twice
      if (statusCode == HttpStatus.tooManyRequests) {
        emit(PinScreenStates.onGetTooManyRequestsError(e.message.toString()));
      } else {
        emit(PinScreenStates.onError(e.message.toString()));
      }
    }
  }

  void resetPin(LoginRequestModel request) async {
    emit(const PinScreenStates.loading());
    try {
      final LoginResponse response = await authRepository.resetPin(request);
      emit(PinScreenStates.onVerifiedPin(response.authTokens));
    } on DioException catch (e) {
      emit(PinScreenStates.onError(e.message.toString()));
    }
  }

  void setPin(LoginRequestModel request) async {
    emit(const PinScreenStates.loading());
    try {
      final LoginResponse response = await authRepository.setPin(request);
      emit(PinScreenStates.onVerifiedPin(response.authTokens));
    } on DioException catch (e) {
      emit(PinScreenStates.onError(e.message.toString()));
    }
  }
}
