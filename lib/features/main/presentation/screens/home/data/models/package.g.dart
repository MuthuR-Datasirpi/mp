// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Packages _$PackagesFromJson(Map<String, dynamic> json) => Packages(
      json['id'] as int?,
      json['createdDate'] as String?,
      json['lastModifiedDate'] as String?,
      json['createdBy'] as String?,
      json['lastModifiedBy'] as String?,
      json['version'] as int?,
      json['name'] as String?,
      json['nameAr'] as String?,
      (json['price'] as num?)?.toDouble(),
      json['priceAr'] as String?,
      json['daysPerWeek'] as String?,
      json['daysPerWeekAr'] as String?,
      json['duration'] as String?,
      (json['cities'] as List<dynamic>?)
          ?.map((e) => City.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['durationAr'] as String?,
      (json['menuGroups'] as List<dynamic>?)
          ?.map((e) => MenuGroups.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
