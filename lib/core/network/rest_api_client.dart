import 'package:dio/dio.dart';
import 'package:mobile/core/locationmanager/google_geocode_apis.dart';
import 'package:mobile/core/locationmanager/model/google_geocoding_response.dart';
import 'package:mobile/core/locationmanager/model/google_places_response.dart';
import 'package:mobile/core/network/end_points.dart';
import 'package:mobile/features/address/data/models/address_details_request.dart';
import 'package:mobile/features/address/data/models/address_details_response.dart';
import 'package:mobile/features/auth/data/models/auth_payload_model.dart';
import 'package:mobile/features/auth/data/models/auth_response_model.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/address_model.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/brands_response.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/categories_response.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/plans_response.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/search_response.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/search_suggestions_model.dart';
import 'package:mobile/features/profile/data/models/city_location_response_model.dart';
import 'package:mobile/features/profile/data/models/city_selection_request_model.dart';
import 'package:mobile/features/profile/data/models/city_selection_response_model.dart';
import 'package:mobile/features/profile/data/models/name_request_model.dart';
import 'package:mobile/features/profile/data/models/name_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_api_client.g.dart';

@RestApi()
abstract class RestAPIClient {
  factory RestAPIClient(Dio dio, {String baseUrl}) = _RestAPIClient;

  @POST(Endpoints.onProceedWithPhoneNumber)
  Future<PhoneNumberSignupResponse> onProceedWithPhoneNumber(
      @Body() PostPhoneNumberRequestModel request);

  @POST(Endpoints.login)
  Future<LoginResponse> login(@Body() LoginRequestModel request,
      @Query('shouldLogoutSession') bool? shouldLogoutSession);

  @POST(Endpoints.googleLogin)
  Future<LoginResponse> googleLogin(@Body() GoogleSigninRequestModel request);

  @POST(Endpoints.resetPin)
  Future<LoginResponse> resetPin(@Body() LoginRequestModel request);

  @POST(Endpoints.setPin)
  Future<LoginResponse> setPin(@Body() LoginRequestModel request);

  @POST(Endpoints.forgotPin)
  Future onProceedForgotPin(@Body() PostPhoneNumberRequestModel request);

  @POST(Endpoints.verifyOTP)
  Future<VerifyOtpResponseModel> verifyOTP(
      @Body() VerifyOtpRequestModel request);

  @POST(Endpoints.resendOtp)
  Future<VerifyOtpResponseModel> resendOtp(
      @Body() PostPhoneNumberRequestModel request);

  @PUT(Endpoints.update_users_name)
  Future<NameResponseModel> addName(
    @Body() NameRequestModel payload,
  );

  @PUT(Endpoints.citySelectScreen)
  Future<SaveCityResponseModel> saveCity(
    @Body() CityRequestModel payload,
  );

  @GET(Endpoints.locationCity)
  Future<CityLocationResponseModel> getCities();

  @GET(Endpoints.address)
  Future<AddressResponse> getAddress();

  @GET(Endpoints.getAddressTypes)
  Future<AddressTypesResponse> getAddressTypes();

  @POST(Endpoints.address)
  Future<SaveAddressResponse> saveAddress(
      @Body() AddressDetailsRequest request);

  @GET(Endpoints.getAllCategories)
  Future<CategoriesResponse> getAllCategories(
      @Query('page') int? page, @Query('size') int? size);

  @GET(Endpoints.getAllBrands)
  Future<BrandsResponse> getAllBrands();

  @GET(Endpoints.getBrandsByCategoryId)
  Future<BrandsResponse> getBrandsByCategoryId(@Path('category_id') categoryId);

  @GET(Endpoints.getPlansByBrandId)
  Future<PlansResponse> getPlansByBrandId(@Path('brand_id') brandId);

  @GET(Endpoints.searchSuggestions)
  Future<SearchSuggestions> getSearchSuggestions(@Path('term') term);

  @POST(Endpoints.search)
  Future<SearchResponse> search({
    @Body() required Map<String, dynamic> searchData,
  });

  ///
  /// Api endpoints of Google Geocoder services
  ///
  @GET(GoogleLocationApis.googleGeoCoder)
  Future<GoogleGeocodingResponse> getLocationByPlaceId(
    @Query('place_id') String placeId,
    @Query('key') String mapKey,
  );

  @GET(GoogleLocationApis.googleGeoCoder)
  Future<GoogleGeocodingResponse> getLocationByQuery(
    @Query('address') String query,
    @Query('key') String mapKey,
  );

  @GET(GoogleLocationApis.googleGeoCoder)
  Future<GoogleGeocodingResponse> getLocationByCoordinates(
    @Query('latlng') String latLng,
    @Query('key') String mapKey,
  );

  @GET(GoogleLocationApis.googlePlacesAutoComplete)
  Future<GooglePlacesResponse> getGooglePlacesAutoComplete(
    @Query('input') String query,
    @Query('key') String mapKey,
  );

  ///
  /// Api endpoints of Google Geocoder services
  ///
}
