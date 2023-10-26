import 'package:mobile/core/locationmanager/model/google_geocoding_response.dart';
import 'package:mobile/core/locationmanager/model/google_places_response.dart';
import 'package:mobile/core/network/rest_api_client.dart';

class GoogleLocationApis {
  final RestAPIClient restAPIClient;
  String mapKey;

  GoogleLocationApis({required this.restAPIClient, required this.mapKey});

  static const googleGeoCoder =
      'https://maps.googleapis.com/maps/api/geocode/json';
  static const googlePlacesAutoComplete =
      'https://maps.googleapis.com/maps/api/place/autocomplete/json';

  ///      The following example filters the addresses returned to include only those with a location type of ROOFTOP and an address type of street_address.
  ///      https://maps.googleapis.com/maps/api/geocode/json?latlng=40.714224,-73.961452&location_type=ROOFTOP&result_type=street_address&key=YOUR_API_KEY
  ///
  ///
  ///      Reference: https://developers.google.com/maps/documentation/geocoding/requests-geocoding#StatusCodes
  Future<GoogleGeocodingResponse> getLocationByCoordinates(
      String latLng) async {
    return await restAPIClient.getLocationByCoordinates(latLng, mapKey);
  }

  ///     To get location detail by giving placeId
  ///
  ///
  ///     Referemce: https://developers.google.com/maps/documentation/geocoding/requests-places-geocoding
  Future<GoogleGeocodingResponse> getLocationByPlaceId(String placeId) async {
    return await restAPIClient.getLocationByPlaceId(placeId, mapKey);
  }

  ///       With bound
  ///       https://maps.googleapis.com/maps/api/geocode/json?address=Washington&bounds=36.47,-84.72%7C43.39,-65.90&key=YOUR_API_KEY
  ///
  ///       With region
  ///       https://maps.googleapis.com/maps/api/geocode/json?address=Toledo&region=es&key=YOUR_API_KEY
  ///
  ///       With component=country:GB
  ///       https://maps.googleapis.com/maps/api/geocode/json?address=high+st+hasting&components=country:GB&key=YOUR_API_KEY
  ///
  ///
  ///       Reference: https://developers.google.com/maps/documentation/geocoding/requests-geocoding#StatusCodes:~:text=https%3A//maps.googleapis.com/maps/api/geocode/json%3Faddress%3DWashington%26key%3DYOUR_API_KEY
  Future<GoogleGeocodingResponse> getLocationByQuery(String query) async {
    return await restAPIClient.getLocationByQuery(query, mapKey);
  }

  ///     To search text related to places, food or any ambiguous string
  ///     https://developers.google.com/maps/documentation/places/web-service/search-text
  ///
  ///     Reference: https://developers.google.com/maps/documentation/places/web-service/autocomplete#maps_http_places_autocomplete_paris-txt
  Future<GooglePlacesResponse> getPlacesPredictionsByQuery(String query) async {
    return await restAPIClient.getGooglePlacesAutoComplete(query, mapKey);
  }
}
