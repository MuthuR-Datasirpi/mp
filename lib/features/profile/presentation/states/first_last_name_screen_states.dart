import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/profile/data/models/name_response_model.dart';

part 'first_last_name_screen_states.freezed.dart';

@Freezed()
class NameScreenStates with _$NameScreenStates {
  const factory NameScreenStates.initial() = initial;
  const factory NameScreenStates.loading() = showloading;
  const factory NameScreenStates.onError(String? error) = showError;
  const factory NameScreenStates.onNameSaved(NameResponseModel response) =
      onValidPhoneNumber;
}
