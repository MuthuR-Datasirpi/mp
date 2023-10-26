import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'location_screen_states.freezed.dart';

@Freezed()
class LocationScreenStates with _$LocationScreenStates {
  const factory LocationScreenStates.initial() = initial;
  const factory LocationScreenStates.loading() = showloading;
  const factory LocationScreenStates.onError(String? error) = showError;
  const factory LocationScreenStates.onLoadedMap(LatLng currentLocation) = onLoadedMap;
}
