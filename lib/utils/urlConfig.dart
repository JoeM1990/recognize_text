// ignore_for_file: constant_identifier_names, file_names

class UrlConfig {
  //Auth
  static const String BASE_URL = 'http://192.168.1.79:9090/';
  static const String SIGN_IN = '${BASE_URL}api/auth/signin';
  static const String SIGN_UP = '${BASE_URL}api/auth/signup';
  static const String SIGN_OUT = '${BASE_URL}api/auth/signout';
  static const String SEND_OTP = '${BASE_URL}api/auth/generateOtp';
  static const String CHECK_OTP = '${BASE_URL}api/auth/validateOtp';
  static const String CHANGE_PASSWORD = '${BASE_URL}api/auth/user';
}
