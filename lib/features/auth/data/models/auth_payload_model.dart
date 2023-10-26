import 'package:json_annotation/json_annotation.dart';

part 'auth_payload_model.g.dart';

@JsonSerializable(createToJson: true)
class PostPhoneNumberRequestModel {
  String? countryCode;
  String? mobileNumber;

  PostPhoneNumberRequestModel(
    this.countryCode,
    this.mobileNumber,
  );

  factory PostPhoneNumberRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PostPhoneNumberRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostPhoneNumberRequestModelToJson(this);
}

@JsonSerializable(createToJson: true)
class VerifyOtpRequestModel extends PostPhoneNumberRequestModel {
  int? otp;

  VerifyOtpRequestModel(
    this.otp,
    String countryCode,
    String mobileNumber,
  ) : super(countryCode, mobileNumber);

  factory VerifyOtpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$VerifyOtpRequestModelToJson(this);
}

@JsonSerializable(createToJson: true)
class LoginRequestModel extends PostPhoneNumberRequestModel {
  int? pin;

  LoginRequestModel(
    this.pin,
    String countryCode,
    String mobileNumber,
  ) : super(countryCode, mobileNumber);

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}

@JsonSerializable(createToJson: true)
class GoogleSigninRequestModel {
  String? accessToken;
  String? idToken;

  GoogleSigninRequestModel(
    this.accessToken,
    this.idToken,
  );
  
  @override
  factory GoogleSigninRequestModel.fromJson(Map<String, dynamic> json) =>
      _$GoogleSigninRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleSigninRequestModelToJson(this);
}
