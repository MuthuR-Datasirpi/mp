// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressResponse _$AddressResponseFromJson(Map<String, dynamic> json) =>
    AddressResponse(
      json['message'] as String?,
      (json['payload'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddressResponseToJson(AddressResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'payload': instance.payload,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      json['id'] as int?,
      json['label'] as String?,
      json['buildingName'] as String?,
      json['city'] as String?,
      json['floor'] as String?,
      json['houseNumber'] as String?,
      json['landmark'] as String?,
      json['street'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'buildingName': instance.buildingName,
      'houseNumber': instance.houseNumber,
      'floor': instance.floor,
      'street': instance.street,
      'landmark': instance.landmark,
      'city': instance.city,
    };
