import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/core/locationmanager/model/google_geocoding_response.dart';

import 'places_predictions.dart';

part 'address.g.dart';

enum AddressType { home, work, other }

class AddressIcon {
  AddressIcon({
    required this.label,
    required this.icon,
    required this.type,
  });

  final String label;
  final IconData icon;
  final AddressType type;

  AddressIcon copyWith({
    String? label,
    IconData? icon,
    AddressType? type,
  }) {
    return AddressIcon(
      label: label ?? this.label,
      icon: icon ?? this.icon,
      type: type ?? this.type,
    );
  }
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Address {
  final int? id;
  @JsonKey(name: 'map_name')
  final String? addressString;
  final String name;
  final String? label;
  final String? subLocality;
  final String? locality;
  final String? country;
  final String? city;
  final double? latitude;
  final double? longitude;
  @JsonKey(name: 'tag')
  final AddressType? addressType;
  final String? placeId;
  String? address;

  Address({
    this.id,
    this.addressString,
    required this.name,
    this.label,
    this.subLocality,
    this.locality,
    this.country,
    this.city,
    this.latitude,
    this.longitude,
    this.addressType,
    this.placeId,
  }) {
    address = addressString;
  }

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json['id'] as int?,
        addressString: json['map_name'] as String?,
        name: json['name'] as String,
        label: json['label'] as String?,
        subLocality: json['sub_locality'] as String?,
        locality: json['locality'] as String?,
        country: json['country'] as String?,
        city: json['city'] as String?,
        latitude: double.parse(json['latitude'] as String),
        longitude: double.parse(json['longitude'] as String),
        addressType: $enumDecodeNullable(_$AddressTypeEnumMap, json['tag']),
      );

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  Address copyWith({
    int? id,
    String? addressString,
    String? name,
    String? label,
    String? subLocality,
    String? locality,
    String? country,
    String? city,
    double? latitude,
    double? longitude,
    AddressType? addressType,
  }) {
    return Address(
      id: id ?? this.id,
      addressString: addressString ?? this.addressString,
      name: name ?? this.name,
      label: label ?? this.label,
      subLocality: subLocality ?? this.subLocality,
      locality: locality ?? this.locality,
      country: country ?? this.country,
      city: city ?? this.city,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      addressType: addressType ?? this.addressType,
    );
  }

  static Address mapPredictionToAddress(PlacesPrediction prediction) {
    return Address(
        name: prediction.primaryText,
        locality: prediction.primaryText,
        subLocality: prediction.secondaryText,
        addressString: prediction.fullText);
  }

  static Address mapGeocodeToAddress(GeocodeResult result) {
    String? locality;
    String? subLocality1;
    String? subLocality2;
    String? province;
    String? country;
    result.addressComponents.forEach((element) {
      if (element.types != null) {
        if (element.types!.contains('sublocality_level_1')) {
          subLocality1 = element.shortName;
        }
        if (element.types!.contains('sublocality_level_2')) {
          subLocality2 = element.shortName;
        }
        if (element.types!.contains('locality')) {
          locality = element.shortName;
        }
        if (element.types!.contains('administrative_area_level_1')) {
          province = element.shortName;
        }
        if (element.types!.contains('country')) {
          country = element.shortName;
        }
      }
    });
    return Address(
        name: result.addressComponents.first.shortName ?? '',
        locality: locality,
        subLocality: subLocality1 ?? subLocality2,
        country: country,
        latitude: result.geometry.location.latitude,
        longitude: result.geometry.location.longitude,
        addressString: result.formattedAddress,
        placeId: result.placeId);
  }
}
