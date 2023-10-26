import 'package:json_annotation/json_annotation.dart';

part 'address_details_request.g.dart';

@JsonSerializable(createToJson: true)
class AddressDetailsRequest {
  int? addressTypeId;
  String? buildingName;
  String? doorNumber;
  String? floor;
  String? street;
  int? cityId;
  String? notesForRider;
  String? dropOffInstructions;
  String? label;
  String? latitude;
  String? longitude;

  AddressDetailsRequest(
    this.addressTypeId,
    this.buildingName,
    this.doorNumber,
    this.floor,
    this.street,
    this.cityId,
    this.notesForRider,
    this.dropOffInstructions,
    this.label,
    latitude,
    longitude,
  );

  factory AddressDetailsRequest.fromJson(Map<String, dynamic> json) =>
      _$AddressDetailsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddressDetailsRequestToJson(this);
}
