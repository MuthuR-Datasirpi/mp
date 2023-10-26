// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesResponse _$CategoriesResponseFromJson(Map<String, dynamic> json) =>
    CategoriesResponse(
      json['totalPages'] as int?,
      json['totalElements'] as int?,
      json['size'] as int?,
      (json['content'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['number'] as int?,
      json['numberOfElements'] as int?,
      json['first'] as bool?,
      json['last'] as bool?,
      json['empty'] as bool?,
    );

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      json['id'] as int?,
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
    );
