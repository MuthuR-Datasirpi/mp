// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brands_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandsResponse _$BrandsResponseFromJson(Map<String, dynamic> json) =>
    BrandsResponse(
      json['totalPages'] as int?,
      json['totalElements'] as int?,
      json['size'] as int?,
      (json['content'] as List<dynamic>)
          .map((e) => Brand.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['number'] as int?,
      json['numberOfElements'] as int?,
      json['first'] as bool?,
      json['last'] as bool?,
      json['empty'] as bool?,
    );

Brand _$BrandFromJson(Map<String, dynamic> json) => Brand(
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
      (json['rating'] as num?)?.toDouble(),
      (json['minAmountPerDay'] as num?)?.toDouble(),
    );
