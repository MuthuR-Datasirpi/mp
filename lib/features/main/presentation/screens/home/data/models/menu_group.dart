import 'package:json_annotation/json_annotation.dart';

part 'menu_group.g.dart';


@JsonSerializable(createToJson: false)
class MenuGroups {

  int? id;
  String? createdDate;
  String? lastModifiedDate;
  String? createdBy;
  String? lastModifiedBy;
  int? version;
  String? name;
  String? nameAr;
  String? caloriesRange;
  String? caloriesRangeAr;


  MenuGroups(this.id, this.createdDate, this.lastModifiedDate, this.createdBy, this.lastModifiedBy, this.version, this.name,
      this.nameAr, this.caloriesRange, this.caloriesRangeAr);

  factory MenuGroups.fromJson(Map<String, dynamic> json) =>
      _$MenuGroupsFromJson(json);
}