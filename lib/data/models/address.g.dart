// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      id: json['id'] as int?,
      addressString: json['map_name'] as String?,
      name: json['name'] as String,
      label: json['label'] as String?,
      subLocality: json['sub_locality'] as String?,
      locality: json['locality'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      addressType: $enumDecodeNullable(_$AddressTypeEnumMap, json['tag']),
      placeId: json['place_id'] as String?,
    )..address = json['address'] as String?;

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'map_name': instance.addressString,
      'name': instance.name,
      'label': instance.label,
      'sub_locality': instance.subLocality,
      'locality': instance.locality,
      'country': instance.country,
      'city': instance.city,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'tag': _$AddressTypeEnumMap[instance.addressType],
      'place_id': instance.placeId,
      'address': instance.address,
    };

const _$AddressTypeEnumMap = {
  AddressType.home: 'home',
  AddressType.work: 'work',
  AddressType.other: 'other',
};
