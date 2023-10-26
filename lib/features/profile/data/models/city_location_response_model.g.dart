// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_location_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityLocationResponseObject _$CityLocationResponseObjectFromJson(
        Map<String, dynamic> json) =>
    CityLocationResponseObject(
      json['id'] as int?,
      json['name'] as String?,
    );

Map<String, dynamic> _$CityLocationResponseObjectToJson(
        CityLocationResponseObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

CityLocationResponseModel _$CityLocationResponseModelFromJson(
        Map<String, dynamic> json) =>
    CityLocationResponseModel(
      json['message'] as String?,
      (json['payload'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : CityLocationResponseObject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CityLocationResponseModelToJson(
        CityLocationResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'payload': instance.payload,
    };
