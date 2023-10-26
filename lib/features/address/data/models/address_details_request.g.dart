// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_details_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressDetailsRequest _$AddressDetailsRequestFromJson(
        Map<String, dynamic> json) =>
    AddressDetailsRequest(
      json['addressTypeId'] as int?,
      json['buildingName'] as String?,
      json['doorNumber'] as String?,
      json['floor'] as String?,
      json['street'] as String?,
      json['cityId'] as int?,
      json['notesForRider'] as String?,
      json['dropOffInstructions'] as String?,
      json['label'] as String?,
      json['latitude'],
      json['longitude'],
    );

Map<String, dynamic> _$AddressDetailsRequestToJson(
        AddressDetailsRequest instance) =>
    <String, dynamic>{
      'addressTypeId': instance.addressTypeId,
      'buildingName': instance.buildingName,
      'doorNumber': instance.doorNumber,
      'floor': instance.floor,
      'street': instance.street,
      'cityId': instance.cityId,
      'notesForRider': instance.notesForRider,
      'dropOffInstructions': instance.dropOffInstructions,
      'label': instance.label,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
