import 'package:json_annotation/json_annotation.dart';

part 'address_details_response.g.dart';

@JsonSerializable(createToJson: true)
class AddressTypesResponseObject {
  int? id;
  String? name;

  AddressTypesResponseObject({
    required this.id,
    required this.name,
  });

  factory AddressTypesResponseObject.fromJson(Map<String, dynamic> json) =>
      _$AddressTypesResponseObjectFromJson(json);

  Map<String, dynamic> toJson() => _$AddressTypesResponseObjectToJson(this);
}

@JsonSerializable(createToJson: true)
class AddressTypesResponse {
  String? message;
  List<AddressTypesResponseObject?>? payload;

  AddressTypesResponse({
    required this.message,
    required this.payload,
  });

  factory AddressTypesResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressTypesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddressTypesResponseToJson(this);
}

@JsonSerializable(createToJson: true)
class SaveAddressResponse {
  String? message;
  String? payload;

  SaveAddressResponse({
    required this.message,
    required this.payload,
  });

  factory SaveAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$SaveAddressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SaveAddressResponseToJson(this);
}
