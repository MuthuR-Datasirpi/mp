import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/meal_plan.dart';

part 'search_response.g.dart';

@JsonSerializable(createToJson: false)
class SearchResponse {
  int? searchResultCount;
  List<Brand>? brands;
  List<Category>? categories;

  SearchResponse(this.searchResultCount, this.brands, this.categories);

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class Brand {
  int? id;
  String? name;
  String? createdDate;
  String? lastModifiedDate;
  String? createdBy;
  String? lastModifiedBy;
  int? version;
  String? title;
  String? titleAr;
  String? description;
  String? descriptionAr;
  String? imageUrl;
  double? rating;
  double? minAmountPerDay;
  List<MealPlans>? mealPlans;

  Brand(
      this.id,
      this.name,
      this.createdDate,
      this.lastModifiedDate,
      this.createdBy,
      this.lastModifiedBy,
      this.version,
      this.title,
      this.titleAr,
      this.description,
      this.descriptionAr,
      this.imageUrl,
      this.rating,
      this.minAmountPerDay,
      this.mealPlans);

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
}

@JsonSerializable(createToJson: false)
class Category {
  int? id;
  String? name;
  String? description;
  String? imageUrl;
  List<Brand>? brands;

  Category(this.id, this.name, this.description, this.imageUrl, this.brands);

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
