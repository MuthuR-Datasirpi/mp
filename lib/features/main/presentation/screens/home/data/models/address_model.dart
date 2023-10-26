import 'package:json_annotation/json_annotation.dart';
part 'address_model.g.dart';



@JsonSerializable(createToJson: true)
class AddressResponse {
String? message;
List<Address>? payload;

  AddressResponse(
    this.message,
    this.payload,
 
  );

  factory AddressResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddressResponseToJson(this);
}



@JsonSerializable(createToJson: true)
class Address {
  int? id;
  String? label;
  String? buildingName;
  String? houseNumber;
  String ?floor;
  String ?street;
  String ?landmark;
  String ?city;

  Address(
    this.id,
    this.label,
    this.buildingName,
    this.city,
    this.floor,
    this.houseNumber,
    this.landmark,
    this.street
  );

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}


