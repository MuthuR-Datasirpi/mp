import 'package:json_annotation/json_annotation.dart';

part 'city_selection_response_model.g.dart';

@JsonSerializable(createToJson: true)
class CityResponseObject {
  int? id;
  String? name;

  CityResponseObject(
    this.id,
    this.name,
  );

  factory CityResponseObject.fromJson(Map<String, dynamic> json) =>
      _$CityResponseObjectFromJson(json);

  Map<String, dynamic> toJson() => _$CityResponseObjectToJson(this);
}

@JsonSerializable(createToJson: true)
class CityResponseModel {
  String? message;
  List<CityResponseObject?>? payload;

  CityResponseModel(
    this.message,
    this.payload,
  );

  factory CityResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CityResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityResponseModelToJson(this);
}

@JsonSerializable(createToJson: true)
class SaveCityResponseModel {
  String? message;
  String? payload;

  SaveCityResponseModel(
    this.message,
    this.payload,
  );

  factory SaveCityResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SaveCityResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SaveCityResponseModelToJson(this);
}
