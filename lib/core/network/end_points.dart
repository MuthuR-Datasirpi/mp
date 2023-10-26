class Endpoints {
  Endpoints._();

  ///Api version & directories
  static const _apiVersion = 'api/v1';
  static const _public = 'public';
  static const _sessions = 'sessions';
  static const _auth = 'auth';
  static const onProceedWithPhoneNumber = '/$_auth';
  static const login = '/$_auth/login';
  static const verifyOTP = '/$_auth/verify-otp';
  static const resendOtp = "/$_auth/resend-otp";
  static const forgotPin = "/$_auth/forgot-pin";
  static const googleLogin = "/$_auth/google-login";
  static const setPin = "/$_auth/set-pin";
  static const resetPin = "/$_auth/reset-pin";
  static const getAllCategories = '/categories';
  static const getAllBrands = '/brands';
  static const getBrandsByCategoryId = '/categories/{category_id}/brands';
  static const getPlansByBrandId = '/brands/{brand_id}/meal-plans';
  static const search = '/search';
  static const searchSuggestions = '$search/{term}/suggestions';
  static const users = "users";
  static const update_users_name = "/$users/name";
  static const citySelectScreen = "/$users/city";
  static const locationCity = "/location/city";
  static const address = "/address";
  static const getAddressTypes = "$address/types";
}
