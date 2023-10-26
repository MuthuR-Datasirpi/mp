import 'package:mobile/core/network/rest_api_client.dart';
import 'package:mobile/features/address/data/models/address_details_request.dart';
import 'package:mobile/features/address/data/models/address_details_response.dart';
import 'package:mobile/features/address/domain/repository/address_details_repository.dart';

class AddressDetailsRepositoryImplementation extends AddressDetailsRepository {
  AddressDetailsRepositoryImplementation({
    required this.restAPIClient,
  });

  final RestAPIClient restAPIClient;

  @override
  Future<AddressTypesResponse> getAddressTypes() async {
    return await restAPIClient.getAddressTypes();
  }

  @override
  Future<SaveAddressResponse> saveAddress(AddressDetailsRequest payload) async {
    return await restAPIClient.saveAddress(payload);
  }
}
