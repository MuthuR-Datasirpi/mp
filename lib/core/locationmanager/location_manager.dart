import 'package:geolocator/geolocator.dart';
import 'package:mobile/app/app.dart';
import 'package:mobile/app/app_config.dart';
import 'package:mobile/core/di/injector.dart';
import 'package:mobile/core/extensions/build_context.dart';
import 'package:mobile/core/locationmanager/google_geocode_apis.dart';
import 'package:mobile/core/locationmanager/model/google_geocoding_response.dart';
import 'package:mobile/core/network/rest_api_client.dart';
import 'package:mobile/data/models/address.dart';
import 'package:mobile/data/models/places_predictions.dart';

/// *
/// LocationManager is responsible for managing various location-related tasks within your application
/// **
class LocationManager {
  LocationManager._();

  static Position? currentPosition;
  static double? currentLatitude;
  static double? currentLongitude;

  static final _googleLocationApis = GoogleLocationApis(
      restAPIClient: Injector.resolve<RestAPIClient>(),
      mapKey: AppConfig.mapsApiKey);

  ///To get current location of the Device/User
  static Future<Position> getCurrentLocation() async {
    currentPosition = await GeolocatorPlatform.instance.getCurrentPosition(locationSettings: const LocationSettings(accuracy: LocationAccuracy.high));
    return currentPosition!;
  }

  ///To Request Location Permission
  static Future<LocationPermission> requestLocationPermission() async {
    LocationPermission permission =
        await GeolocatorPlatform.instance.requestPermission();
    return permission;
  }

  ///To Check location permission  status and location services on device
  static Future<LocationPermission> checkLocationPermission() async {
    bool serviceEnabled =
        await GeolocatorPlatform.instance.isLocationServiceEnabled();
    if (!serviceEnabled) {
      /// Location services are not enabled don't continue
      /// Accessing the position and request users of the
      /// App to enable the location services.
      MealPlanetApp.appContext
          ?.showToast(message: 'Location services are disabled.');
    }
    LocationPermission permission =
        await GeolocatorPlatform.instance.checkPermission();
    return permission;
  }

  ///To get address details from coordinates
  static Future<Address> getAddressFromCoordinates(
      double latitude, double longitude) async {
    final response = await _googleLocationApis
        .getLocationByCoordinates('$latitude,$longitude');
    final address = Address.mapGeocodeToAddress(response.results.first);
    return address;
  }

  ///To get coordinates from address string
  static Future<Location> getCoordinatesFromAddress(
      String addressString) async {
    final response =
        await _googleLocationApis.getLocationByQuery(addressString);
    final location = response.results.first.geometry.location;
    return location;
  }

  ///To get places predictions from search string
  static Future<List<PlacesPrediction>> getPredictionsFromGooglePlaces(
      String query) async {
    final response =
        await _googleLocationApis.getPlacesPredictionsByQuery(query);
    final predictions = response.predictions
        .map((e) => PlacesPrediction.mapPredictionToPlacesPrediction(e))
        .toList();
    return predictions;
  }

  ///To get place by place id
  static Future<Address> getLocationByPlaceId(String placeId) async {
    final response = await _googleLocationApis.getLocationByPlaceId(placeId);
    return Address.mapGeocodeToAddress(response.results.first);
  }

  static Future<bool> openLocationSettings() async {
    return await GeolocatorPlatform.instance.openLocationSettings();
  }
}
