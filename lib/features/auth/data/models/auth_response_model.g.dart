// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['userName'] as String?,
      json['userId'] as String?,
      json['hasActiveSessions'] as bool?,
      json['mobileNumberVerified'] as bool?,
      json['pinSet'] as bool?,
      json['newUser'] as bool?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userName': instance.userName,
      'userId': instance.userId,
      'hasActiveSessions': instance.hasActiveSessions,
      'mobileNumberVerified': instance.mobileNumberVerified,
      'pinSet': instance.pinSet,
      'newUser': instance.newUser,
    };

AuthTokens _$AuthTokensFromJson(Map<String, dynamic> json) => AuthTokens(
      json['access_token'] as String?,
      json['refresh_token'] as String?,
    );

Map<String, dynamic> _$AuthTokensToJson(AuthTokens instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };

PhoneNumberSignupResponse _$PhoneNumberSignupResponseFromJson(
        Map<String, dynamic> json) =>
    PhoneNumberSignupResponse(
      json['message'] as String?,
      json['payload'] == null
          ? null
          : User.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PhoneNumberSignupResponseToJson(
        PhoneNumberSignupResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'payload': instance.payload,
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      json['message'] as String?,
      json['payload'] == null
          ? null
          : AuthTokens.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'payload': instance.authTokens,
    };

VerifyOtpResponseModel _$VerifyOtpResponseModelFromJson(
        Map<String, dynamic> json) =>
    VerifyOtpResponseModel(
      json['message'] as String?,
      json['payload'] as String?,
    );

Map<String, dynamic> _$VerifyOtpResponseModelToJson(
        VerifyOtpResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'payload': instance.payload,
    };
