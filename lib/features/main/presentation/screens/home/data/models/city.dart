import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/package.dart';

part 'city.g.dart';


@JsonSerializable(createToJson: false)
class City {
  int? id;
  String? createdDate;
  String? lastModifiedDate;
  String? createdBy;
  String? lastModifiedBy;
  int? version;
  String? name;
  String? nameAr;
  String? code;
  double? taxPercentage;
  String? taxPercentageAr;

  City(this.id, this.createdDate, this.lastModifiedDate, this.createdBy, this.lastModifiedBy, this.version, this.name,
      this.nameAr, this.code, this.taxPercentage, this.taxPercentageAr);

  factory City.fromJson(Map<String, dynamic> json) =>
      _$CityFromJson(json);
}
