import 'package:mobile/features/auth/data/models/auth_payload_model.dart';
import 'package:mobile/features/auth/data/models/auth_response_model.dart';

abstract class AuthRepository {
  Future<PhoneNumberSignupResponse> onProceedWithPhoneNumber(
      PostPhoneNumberRequestModel request);

  Future<VerifyOtpResponseModel> verifyOTP(VerifyOtpRequestModel request);

  Future<VerifyOtpResponseModel> resendOtp(PostPhoneNumberRequestModel request);

  Future<LoginResponse> login(LoginRequestModel request, bool shouldLogoutSession);

  Future<LoginResponse> setPin(LoginRequestModel request);

  Future<LoginResponse> resetPin(LoginRequestModel request);

  Future onProceedForgotPin(PostPhoneNumberRequestModel request);

  Future<LoginResponse> googleLogin(GoogleSigninRequestModel request);

}
