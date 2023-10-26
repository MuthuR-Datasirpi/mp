import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/city.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/menu_group.dart';

part 'package.g.dart';


@JsonSerializable(createToJson: false)
class Packages {
  int? id;
  String? createdDate;
  String? lastModifiedDate;
  String? createdBy;
  String? lastModifiedBy;
  int? version;
  String? name;
  String? nameAr;
  double? price;
  String? priceAr;
  String? daysPerWeek;
  String? daysPerWeekAr;
  String? duration;
  String? durationAr;
  List<MenuGroups>? menuGroups;
  List<City>? cities;


  Packages(this.id, this.createdDate, this.lastModifiedDate, this.createdBy, this.lastModifiedBy, this.version, this.name,
      this.nameAr, this.price, this.priceAr, this.daysPerWeek, this.daysPerWeekAr, this.duration, this.cities, this.durationAr,this.menuGroups);

  factory Packages.fromJson(Map<String, dynamic> json) =>
      _$PackagesFromJson(json);
}