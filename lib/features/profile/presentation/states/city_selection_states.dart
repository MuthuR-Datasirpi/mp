import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/profile/data/models/city_location_response_model.dart';
import 'package:mobile/features/profile/data/models/city_selection_response_model.dart';

part 'city_selection_states.freezed.dart';

@Freezed()
class CityScreenStates with _$CityScreenStates {
  const factory CityScreenStates.initial() = initial;
  const factory CityScreenStates.loading() = showloading;
  const factory CityScreenStates.onError(String? error) = showError;
  const factory CityScreenStates.onCitiesFetched(
      List<CityLocationResponseObject?>? cities) = onCitiesFetched;
  const factory CityScreenStates.onCitiesFiltered(
      List<CityLocationResponseObject?>? cities) = onCitiesFiltered;
  const factory CityScreenStates.onSavedCity(SaveCityResponseModel response) =
      onSavedCity;
}
