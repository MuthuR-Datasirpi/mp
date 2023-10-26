import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/auth/data/models/auth_response_model.dart';

part 'login_screen_states.freezed.dart';

@Freezed()
class LoginScreenStates with _$LoginScreenStates {
  const factory LoginScreenStates.initial() = initial;
  const factory LoginScreenStates.loading() = showloading;
  const factory LoginScreenStates.onError(String? error) = showError;
  const factory LoginScreenStates.onPhoneNumberValidated(
      PhoneNumberSignupResponse response) = onPhoneNumberValidated;
  const factory LoginScreenStates.onSuccessForgotPin() = onSuccessForgotPin;
  const factory LoginScreenStates.onSuccessGoogleSignIn(
      LoginResponse response) = onSuccessGoogleSignIn;
}
