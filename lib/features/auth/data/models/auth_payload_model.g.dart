// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_payload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostPhoneNumberRequestModel _$PostPhoneNumberRequestModelFromJson(
        Map<String, dynamic> json) =>
    PostPhoneNumberRequestModel(
      json['countryCode'] as String?,
      json['mobileNumber'] as String?,
    );

Map<String, dynamic> _$PostPhoneNumberRequestModelToJson(
        PostPhoneNumberRequestModel instance) =>
    <String, dynamic>{
      'countryCode': instance.countryCode,
      'mobileNumber': instance.mobileNumber,
    };

VerifyOtpRequestModel _$VerifyOtpRequestModelFromJson(
        Map<String, dynamic> json) =>
    VerifyOtpRequestModel(
      json['otp'] as int?,
      json['countryCode'] as String,
      json['mobileNumber'] as String,
    );

Map<String, dynamic> _$VerifyOtpRequestModelToJson(
        VerifyOtpRequestModel instance) =>
    <String, dynamic>{
      'countryCode': instance.countryCode,
      'mobileNumber': instance.mobileNumber,
      'otp': instance.otp,
    };

LoginRequestModel _$LoginRequestModelFromJson(Map<String, dynamic> json) =>
    LoginRequestModel(
      json['pin'] as int?,
      json['countryCode'] as String,
      json['mobileNumber'] as String,
    );

Map<String, dynamic> _$LoginRequestModelToJson(LoginRequestModel instance) =>
    <String, dynamic>{
      'countryCode': instance.countryCode,
      'mobileNumber': instance.mobileNumber,
      'pin': instance.pin,
    };

GoogleSigninRequestModel _$GoogleSigninRequestModelFromJson(
        Map<String, dynamic> json) =>
    GoogleSigninRequestModel(
      json['accessToken'] as String?,
      json['idToken'] as String?,
    );

Map<String, dynamic> _$GoogleSigninRequestModelToJson(
        GoogleSigninRequestModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'idToken': instance.idToken,
    };
