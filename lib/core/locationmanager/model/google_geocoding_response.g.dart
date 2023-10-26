// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_geocoding_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleGeocodingResponse _$GoogleGeocodingResponseFromJson(
        Map<String, dynamic> json) =>
    GoogleGeocodingResponse(
      status: json['status'] as String,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => GeocodeResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GoogleGeocodingResponseToJson(
        GoogleGeocodingResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'status': instance.status,
    };

GeocodeResult _$GeocodeResultFromJson(Map<String, dynamic> json) =>
    GeocodeResult(
      addressComponents: (json['address_components'] as List<dynamic>)
          .map((e) => AddressComponents.fromJson(e as Map<String, dynamic>))
          .toList(),
      formattedAddress: json['formatted_address'] as String,
      geometry: Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      placeId: json['place_id'] as String,
    );

Map<String, dynamic> _$GeocodeResultToJson(GeocodeResult instance) =>
    <String, dynamic>{
      'address_components': instance.addressComponents,
      'formatted_address': instance.formattedAddress,
      'geometry': instance.geometry,
      'place_id': instance.placeId,
    };

Geometry _$GeometryFromJson(Map<String, dynamic> json) => Geometry(
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeometryToJson(Geometry instance) => <String, dynamic>{
      'location': instance.location,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      latitude: (json['lat'] as num).toDouble(),
      longitude: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'lat': instance.latitude,
      'lng': instance.longitude,
    };

AddressComponents _$AddressComponentsFromJson(Map<String, dynamic> json) =>
    AddressComponents(
      longName: json['long_name'] as String?,
      shortName: json['short_name'] as String?,
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AddressComponentsToJson(AddressComponents instance) =>
    <String, dynamic>{
      'long_name': instance.longName,
      'short_name': instance.shortName,
      'types': instance.types,
    };
