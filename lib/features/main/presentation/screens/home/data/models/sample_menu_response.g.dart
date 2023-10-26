// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_menu_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SampleMenuResponse _$SampleMenuResponseFromJson(Map<String, dynamic> json) =>
    SampleMenuResponse(
      day: json['day'] as String,
      menuGroups: (json['menuGroups'] as List<dynamic>)
          .map((e) => MenuGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

MenuGroup _$MenuGroupFromJson(Map<String, dynamic> json) => MenuGroup(
      name: json['name'] as String,
      id: json['id'] as int,
      sampleMenuItems: (json['sampleMenuItems'] as List<dynamic>)
          .map((e) => MenuItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

MenuItem _$MenuItemFromJson(Map<String, dynamic> json) => MenuItem(
      id: json['id'] as int,
      createdDate: json['createdDate'] as String,
      lastModifiedDate: json['lastModifiedDate'] as String,
      createdBy: json['createdBy'] as String,
      lastModifiedBy: json['lastModifiedBy'] as String,
      version: json['version'] as int,
      name: json['name'] as String,
      nameAr: json['nameAr'] as String,
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String,
      descriptionAr: json['descriptionAr'] as String,
      calories: json['calories'] as int,
      fats: json['fats'] as int,
      carbs: json['carbs'] as int,
      proteins: json['proteins'] as int,
      day: json['day'] as String,
      planId: json['planId'] as int,
      menuGroupId: json['menuGroupId'] as int,
    );
