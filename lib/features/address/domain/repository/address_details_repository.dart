
import 'package:mobile/features/address/data/models/address_details_request.dart';
import 'package:mobile/features/address/data/models/address_details_response.dart';

abstract class AddressDetailsRepository {
  Future<SaveAddressResponse> saveAddress(AddressDetailsRequest payload);
  Future<AddressTypesResponse> getAddressTypes();
}
