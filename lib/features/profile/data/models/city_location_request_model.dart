import 'package:json_annotation/json_annotation.dart';

part 'city_location_request_model.g.dart';

@JsonSerializable(createToJson: true)
class CityLocationRequestModel {
  String message;
  String payload;

  CityLocationRequestModel(
    this.message,
    this.payload,
  );

  factory CityLocationRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CityLocationRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityLocationRequestModelToJson(this);
}
