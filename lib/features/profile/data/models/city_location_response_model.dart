import 'package:json_annotation/json_annotation.dart';

part 'city_location_response_model.g.dart';

@JsonSerializable(createToJson: true)
class CityLocationResponseObject {
  int? id;
  String? name;

  CityLocationResponseObject(
    this.id,
    this.name,
  );

  factory CityLocationResponseObject.fromJson(Map<String, dynamic> json) =>
      _$CityLocationResponseObjectFromJson(json);

  Map<String, dynamic> toJson() => _$CityLocationResponseObjectToJson(this);
}

@JsonSerializable(createToJson: true)
class CityLocationResponseModel {
  String? message;
  List<CityLocationResponseObject?>? payload;

  CityLocationResponseModel(
    this.message,
    this.payload,
  );

  factory CityLocationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CityLocationResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityLocationResponseModelToJson(this);
}
