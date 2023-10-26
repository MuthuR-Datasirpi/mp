import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/package.dart';

part 'meal_plan.g.dart';


@JsonSerializable(createToJson: false)
class MealPlans {
  int? id;
  String? createdDate;
  String? lastModifiedDate;
  String? createdBy;
  String? lastModifiedBy;
  double? version;
  String? title;
  String? titleAr;
  String? description;
  String? descriptionAr;
  String? imageUrl;
  double? rating;
  double? amount;
  String? amountAr;
  double? discountPercentage;
  String? benefits;
  String? benefitsAr;
  String? dietaryInfo;
  String? dietaryInfoAr;
  List<Packages>? packages;


  MealPlans(this.id, this.createdDate, this.lastModifiedDate, this.createdBy, this.lastModifiedBy, this.version,
      this.title, this.titleAr, this.description, this.descriptionAr, this.imageUrl, this.rating, this.amount, this.amountAr,
      this.discountPercentage, this.benefits, this.benefitsAr, this.dietaryInfo, this.dietaryInfoAr, this.packages
      );

  factory MealPlans.fromJson(Map<String, dynamic> json) =>
      _$MealPlansFromJson(json);
}