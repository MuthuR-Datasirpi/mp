import 'package:json_annotation/json_annotation.dart';

part 'name_request_model.g.dart';

@JsonSerializable(createToJson: true)
class NameRequestModel {
  String? firstName;
  String? lastName;

  NameRequestModel(
    this.firstName,
    this.lastName,
  );

  factory NameRequestModel.fromJson(Map<String, dynamic> json) =>
      _$NameRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$NameRequestModelToJson(this);
}
