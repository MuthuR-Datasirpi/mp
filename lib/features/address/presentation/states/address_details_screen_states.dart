import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/address/data/models/address_details_response.dart';
import 'package:mobile/features/profile/data/models/city_location_response_model.dart';

part 'address_details_screen_states.freezed.dart';

@Freezed()
class AddressDetailsScreenStates with _$AddressDetailsScreenStates {
  const factory AddressDetailsScreenStates.initial() = initial;
  const factory AddressDetailsScreenStates.loading() = showloading;
  const factory AddressDetailsScreenStates.onError(String? error) = showError;
  const factory AddressDetailsScreenStates.onAddressDataFetched(
      List<AddressTypesResponseObject?>? addressTypes,
      List<CityLocationResponseObject?>? cities) = onAddressDataFetched;
  const factory AddressDetailsScreenStates.onSavedAddress(
      SaveAddressResponse response) = onSavedAddress;
}
