// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) =>
    SearchResponse(
      json['searchResultCount'] as int?,
      (json['brands'] as List<dynamic>?)
          ?.map((e) => Brand.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Brand _$BrandFromJson(Map<String, dynamic> json) => Brand(
      json['id'] as int?,
      json['name'] as String?,
      json['createdDate'] as String?,
      json['lastModifiedDate'] as String?,
      json['createdBy'] as String?,
      json['lastModifiedBy'] as String?,
      json['version'] as int?,
      json['title'] as String?,
      json['titleAr'] as String?,
      json['description'] as String?,
      json['descriptionAr'] as String?,
      json['imageUrl'] as String?,
      (json['rating'] as num?)?.toDouble(),
      (json['minAmountPerDay'] as num?)?.toDouble(),
      (json['mealPlans'] as List<dynamic>?)
          ?.map((e) => MealPlans.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      json['id'] as int?,
      json['name'] as String?,
      json['description'] as String?,
      json['imageUrl'] as String?,
      (json['brands'] as List<dynamic>?)
          ?.map((e) => Brand.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
