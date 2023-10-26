import 'package:freezed_annotation/freezed_annotation.dart';

part 'sample_menu_response.g.dart';

class Weekday {
  int id;
  Weekdays day;

  Weekday(this.id, this.day);
}

enum Weekdays { Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday }

@JsonSerializable(createToJson: false)
class SampleMenuResponse {
  SampleMenuResponse({
    required this.day,
    required this.menuGroups,
  });

  String day;
  List<MenuGroup> menuGroups;

  factory SampleMenuResponse.fromJson(Map<String, dynamic> json) =>
      _$SampleMenuResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class MenuGroup {
  String name;
  int id;
  List<MenuItem> sampleMenuItems;

  MenuGroup({
    required this.name,
    required this.id,
    required this.sampleMenuItems,
  });

  factory MenuGroup.fromJson(Map<String, dynamic> json) =>
      _$MenuGroupFromJson(json);
}

@JsonSerializable(createToJson: false)
class MenuItem {
  int id;
  String createdDate;
  String lastModifiedDate;
  String createdBy;
  String lastModifiedBy;
  int version;
  String name;
  String nameAr;
  String imageUrl;
  String description;
  String descriptionAr;
  int calories;
  int fats;
  int carbs;
  int proteins;
  String day;
  int planId;
  int menuGroupId;

  MenuItem({
    required this.id,
    required this.createdDate,
    required this.lastModifiedDate,
    required this.createdBy,
    required this.lastModifiedBy,
    required this.version,
    required this.name,
    required this.nameAr,
    required this.imageUrl,
    required this.description,
    required this.descriptionAr,
    required this.calories,
    required this.fats,
    required this.carbs,
    required this.proteins,
    required this.day,
    required this.planId,
    required this.menuGroupId,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) =>
      _$MenuItemFromJson(json);
}
