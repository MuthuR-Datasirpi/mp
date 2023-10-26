import 'package:json_annotation/json_annotation.dart';

part 'brands_response.g.dart';

@JsonSerializable(createToJson: false)
class BrandsResponse {
  int? totalPages;
  int? totalElements;
  int? size;
  @JsonKey(name: 'content')
  List<Brand> brands;
  int? number;
  int? numberOfElements;
  bool? first;
  bool? last;
  bool? empty;

  BrandsResponse(this.totalPages, this.totalElements, this.size, this.brands,
      this.number, this.numberOfElements, this.first, this.last, this.empty);

  factory BrandsResponse.fromJson(Map<String, dynamic> json) =>
      _$BrandsResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class Brand {
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
  double? rating;
  double? minAmountPerDay;

  Brand(
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
      this.imageUrl,
      this.rating,
      this.minAmountPerDay);

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
}
