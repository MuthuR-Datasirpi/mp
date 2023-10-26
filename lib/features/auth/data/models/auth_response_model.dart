import 'package:json_annotation/json_annotation.dart';

part 'auth_response_model.g.dart';

@JsonSerializable(createToJson: true)
class User {
  String? userName;
  String? userId;
  bool? hasActiveSessions;
  bool? mobileNumberVerified;
  bool? pinSet;
  bool? newUser;

  User(
    this.userName,
    this.userId,
    this.hasActiveSessions,
    this.mobileNumberVerified,
    this.pinSet,
    this.newUser,
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable(createToJson: true, fieldRename: FieldRename.snake)
class AuthTokens {
  String? accessToken;
  String? refreshToken;

  AuthTokens(
    this.accessToken,
    this.refreshToken,
  );

  factory AuthTokens.fromJson(Map<String, dynamic> json) =>
      _$AuthTokensFromJson(json);

  Map<String, dynamic> toJson() => _$AuthTokensToJson(this);
}

@JsonSerializable(createToJson: true)
class PhoneNumberSignupResponse {
  String? message;
  User? payload;

  PhoneNumberSignupResponse(
    this.message,
    this.payload,
  );

  factory PhoneNumberSignupResponse.fromJson(Map<String, dynamic> json) =>
      _$PhoneNumberSignupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneNumberSignupResponseToJson(this);
}

@JsonSerializable(createToJson: true)
class LoginResponse {
  String? message;
  @JsonKey(name: 'payload')
  AuthTokens? authTokens;

  LoginResponse(
    this.message,
    this.authTokens,
  );

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable(createToJson: true)
class VerifyOtpResponseModel {
  String? message;
  String? payload;

  VerifyOtpResponseModel(
    this.message,
    this.payload,
  );

  factory VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOtpResponseModelToJson(this);
}
