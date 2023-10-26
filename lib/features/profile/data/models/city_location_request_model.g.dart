// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_location_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityLocationRequestModel _$CityLocationRequestModelFromJson(
        Map<String, dynamic> json) =>
    CityLocationRequestModel(
      json['message'] as String,
      json['payload'] as String,
    );

Map<String, dynamic> _$CityLocationRequestModelToJson(
        CityLocationRequestModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'payload': instance.payload,
    };
