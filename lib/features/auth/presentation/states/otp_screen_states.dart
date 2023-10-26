import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/auth/data/models/auth_response_model.dart';
part 'otp_screen_states.freezed.dart';

@Freezed()
class OtpScreenStates with _$OtpScreenStates {
  const factory OtpScreenStates.initial() = initial;
  const factory OtpScreenStates.loading() = showloading;
  const factory OtpScreenStates.onError(String error) = showError;
  const factory OtpScreenStates.onGetTooManyRequestsError(String error) =
      onGetTooManyRequestsError;
  const factory OtpScreenStates.onVerifiedOtp(
      VerifyOtpResponseModel? response) = onVerifiedOtp;
  const factory OtpScreenStates.onSuccessResendOtp(
      VerifyOtpResponseModel? response) = onSuccessResendOtp;
}
