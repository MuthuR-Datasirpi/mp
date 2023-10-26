// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_selection_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityResponseObject _$CityResponseObjectFromJson(Map<String, dynamic> json) =>
    CityResponseObject(
      json['id'] as int?,
      json['name'] as String?,
    );

Map<String, dynamic> _$CityResponseObjectToJson(CityResponseObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

CityResponseModel _$CityResponseModelFromJson(Map<String, dynamic> json) =>
    CityResponseModel(
      json['message'] as String?,
      (json['payload'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : CityResponseObject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CityResponseModelToJson(CityResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'payload': instance.payload,
    };

SaveCityResponseModel _$SaveCityResponseModelFromJson(
        Map<String, dynamic> json) =>
    SaveCityResponseModel(
      json['message'] as String?,
      json['payload'] as String?,
    );

Map<String, dynamic> _$SaveCityResponseModelToJson(
        SaveCityResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'payload': instance.payload,
    };
