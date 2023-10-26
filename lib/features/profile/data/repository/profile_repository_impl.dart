import 'package:mobile/core/network/rest_api_client.dart';
import 'package:mobile/features/profile/data/models/city_location_response_model.dart';
import 'package:mobile/features/profile/data/models/city_selection_request_model.dart';
import 'package:mobile/features/profile/data/models/city_selection_response_model.dart';
import 'package:mobile/features/profile/data/models/name_request_model.dart';
import 'package:mobile/features/profile/data/models/name_response_model.dart';
import 'package:mobile/features/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImplementation extends ProfileRepository {
  ProfileRepositoryImplementation({
    required this.restAPIClient,
  });

  final RestAPIClient restAPIClient;

  @override
  Future<NameResponseModel> addName(NameRequestModel payload) async {
    return await restAPIClient.addName(payload);
  }

  @override
  Future<CityLocationResponseModel> getCities() async {
    return await restAPIClient.getCities();
  }

  @override
  Future<SaveCityResponseModel> saveCity(CityRequestModel payload) async {
    return await restAPIClient.saveCity(payload);
  }
}
