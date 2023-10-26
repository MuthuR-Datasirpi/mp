// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

City _$CityFromJson(Map<String, dynamic> json) => City(
      json['id'] as int?,
      json['createdDate'] as String?,
      json['lastModifiedDate'] as String?,
      json['createdBy'] as String?,
      json['lastModifiedBy'] as String?,
      json['version'] as int?,
      json['name'] as String?,
      json['nameAr'] as String?,
      json['code'] as String?,
      (json['taxPercentage'] as num?)?.toDouble(),
      json['taxPercentageAr'] as String?,
    );
