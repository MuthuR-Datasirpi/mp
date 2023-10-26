import 'package:json_annotation/json_annotation.dart';

part 'google_geocoding_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GoogleGeocodingResponse {
  GoogleGeocodingResponse({
    required this.status,
    List<GeocodeResult>? results,
  }) : results = results ?? [];

  List<GeocodeResult> results;
  String status;

  factory GoogleGeocodingResponse.fromJson(Map<String, dynamic> json) =>
      _$GoogleGeocodingResponseFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GeocodeResult {
  GeocodeResult({
    required this.addressComponents,
    required this.formattedAddress,
    required this.geometry,
    required this.placeId,
  });

  List<AddressComponents> addressComponents;
  String formattedAddress;
  Geometry geometry;
  String placeId;

  factory GeocodeResult.fromJson(Map<String, dynamic> json) =>
      _$GeocodeResultFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Geometry {
  Geometry({
    required this.location,
  });

  Location location;

  factory Geometry.fromJson(Map<String, dynamic> json) =>
      _$GeometryFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Location {
  @JsonKey(name: 'lat')
  double latitude;
  @JsonKey(name: 'lng')
  double longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class AddressComponents {
  AddressComponents({
    required this.longName,
    required this.shortName,
    required this.types,
  });

  String? longName;
  String? shortName;
  List<String>? types;

  factory AddressComponents.fromJson(Map<String, dynamic> json) =>
      _$AddressComponentsFromJson(json);
}
