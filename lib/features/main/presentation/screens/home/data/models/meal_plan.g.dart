// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealPlans _$MealPlansFromJson(Map<String, dynamic> json) => MealPlans(
      json['id'] as int?,
      json['createdDate'] as String?,
      json['lastModifiedDate'] as String?,
      json['createdBy'] as String?,
      json['lastModifiedBy'] as String?,
      (json['version'] as num?)?.toDouble(),
      json['title'] as String?,
      json['titleAr'] as String?,
      json['description'] as String?,
      json['descriptionAr'] as String?,
      json['imageUrl'] as String?,
      (json['rating'] as num?)?.toDouble(),
      (json['amount'] as num?)?.toDouble(),
      json['amountAr'] as String?,
      (json['discountPercentage'] as num?)?.toDouble(),
      json['benefits'] as String?,
      json['benefitsAr'] as String?,
      json['dietaryInfo'] as String?,
      json['dietaryInfoAr'] as String?,
      (json['packages'] as List<dynamic>?)
          ?.map((e) => Packages.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
