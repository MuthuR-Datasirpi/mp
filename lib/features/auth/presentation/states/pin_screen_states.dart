import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/auth/data/models/auth_response_model.dart';
part 'pin_screen_states.freezed.dart';

@Freezed()
class PinScreenStates with _$PinScreenStates {
  const factory PinScreenStates.initial() = initial;
  const factory PinScreenStates.loading() = showloading;
  const factory PinScreenStates.onError(String error) = showError;
  const factory PinScreenStates.onGetTooManyRequestsError(String error) = onGetTooManyRequestsError;
  const factory PinScreenStates.onVerifiedPin(AuthTokens? authTokens) = onVerifiedPin;
}
