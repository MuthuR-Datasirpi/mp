
import 'package:mobile/features/profile/data/models/city_location_response_model.dart';
import 'package:mobile/features/profile/data/models/city_selection_request_model.dart';
import 'package:mobile/features/profile/data/models/city_selection_response_model.dart';
import 'package:mobile/features/profile/data/models/name_request_model.dart';
import 'package:mobile/features/profile/data/models/name_response_model.dart';

abstract class ProfileRepository {
  Future<NameResponseModel> addName(NameRequestModel payload);
  Future<SaveCityResponseModel> saveCity(CityRequestModel payload);
  Future<CityLocationResponseModel> getCities();
}
