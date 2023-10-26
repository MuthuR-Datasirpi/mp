// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressTypesResponseObject _$AddressTypesResponseObjectFromJson(
        Map<String, dynamic> json) =>
    AddressTypesResponseObject(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$AddressTypesResponseObjectToJson(
        AddressTypesResponseObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

AddressTypesResponse _$AddressTypesResponseFromJson(
        Map<String, dynamic> json) =>
    AddressTypesResponse(
      message: json['message'] as String?,
      payload: (json['payload'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : AddressTypesResponseObject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddressTypesResponseToJson(
        AddressTypesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'payload': instance.payload,
    };

SaveAddressResponse _$SaveAddressResponseFromJson(Map<String, dynamic> json) =>
    SaveAddressResponse(
      message: json['message'] as String?,
      payload: json['payload'] as String?,
    );

Map<String, dynamic> _$SaveAddressResponseToJson(
        SaveAddressResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'payload': instance.payload,
    };
