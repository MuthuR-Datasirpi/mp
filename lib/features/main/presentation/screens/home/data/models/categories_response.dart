import 'package:json_annotation/json_annotation.dart';

part 'categories_response.g.dart';

@JsonSerializable(createToJson: false)
class CategoriesResponse {
  int? totalPages;
  int? totalElements;
  int? size;
  @JsonKey(name: 'content')
  List<Category> categories;
  int? number;
  int? numberOfElements;
  bool? first;
  bool? last;
  bool? empty;

  CategoriesResponse(
      this.totalPages,
      this.totalElements,
      this.size,
      this.categories,
      this.number,
      this.numberOfElements,
      this.first,
      this.last,
      this.empty);

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class Category {
  int? id;
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

  Category(
      this.id,
      this.createdDate,
      this.lastModifiedDate,
      this.createdBy,
      this.lastModifiedBy,
      this.version,
      this.title,
      this.titleAr,
      this.description,
      this.descriptionAr,
      this.imageUrl);

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
