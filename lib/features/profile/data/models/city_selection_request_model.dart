import 'package:json_annotation/json_annotation.dart';

part 'city_selection_request_model.g.dart';

@JsonSerializable(createToJson: true)
class CityRequestModel {
  int? cityId;

  CityRequestModel(
    this.cityId,
  );

  factory CityRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CityRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityRequestModelToJson(this);
}
