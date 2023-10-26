import 'package:json_annotation/json_annotation.dart';

part 'name_response_model.g.dart';

@JsonSerializable(createToJson: true)
class NameResponseModel {
  String? message;
  String? payload;

  NameResponseModel(
    this.message,
    this.payload,
  );

  factory NameResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NameResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$NameResponseModelToJson(this);
}
