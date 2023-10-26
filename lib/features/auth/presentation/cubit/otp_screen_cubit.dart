import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/auth/data/models/auth_payload_model.dart';
import 'package:mobile/features/auth/data/models/auth_response_model.dart';
import 'package:mobile/features/auth/domain/repository/auth_repository.dart';
import 'package:mobile/features/auth/presentation/states/otp_screen_states.dart';

class OtpScreenCubit extends Cubit<OtpScreenStates> {
  OtpScreenCubit({
    required this.authRepository,
  }) : super(const OtpScreenStates.initial());

  final AuthRepository authRepository;

  void verifyOTP(VerifyOtpRequestModel request) async {
    emit(const OtpScreenStates.loading());
    try {
      final VerifyOtpResponseModel response =
          await authRepository.verifyOTP(request);
      emit(OtpScreenStates.onVerifiedOtp(response));
    } on DioException catch (e) {
      final statusCode = (e.error as int);

      if ([HttpStatus.tooManyRequests, HttpStatus.badRequest]
          .contains(statusCode)) {
        emit(OtpScreenStates.onGetTooManyRequestsError(e.message.toString()));
      } else {
        emit(OtpScreenStates.onError(e.message.toString()));
      }
    }
  }

  void resendOtp(PostPhoneNumberRequestModel request) async {
    try {
      final VerifyOtpResponseModel response =
          await authRepository.resendOtp(request);
      emit(OtpScreenStates.onSuccessResendOtp(response));
    } on DioException catch (e) {
      emit(OtpScreenStates.onError(e.message.toString()));
    }
  }
}
