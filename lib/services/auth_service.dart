// ignore_for_file: file_names, avoid_print, duplicate_ignore, empty_catches
import 'dart:convert';
// import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:recognize_text/utils/urlConfig.dart';

class AuthService {
  Future signup(String username, String password) async {
    var client = http.Client();
    var uri = Uri.parse(UrlConfig.SIGN_UP);
    List<String> roles = ["admin", "user"];
    String rolesString = roles.join(',');

    var response = await client.post(uri, headers: {
      // 'Content-Type': 'application/json; charset=UTF-8',
    }, body: {
      'username': username,
      'password': password,
      'role': rolesString,
      'profil': '',
    });

    var jsonResponse = json.decode(response.body);

    return jsonResponse;
  }

  Future signIn(String username, String password) async {
    var client = http.Client();
    var uri = Uri.parse(UrlConfig.SIGN_IN);
    var response = await client.post(uri, headers: {
      // 'Content-Type': 'application/json',
    }, body: {
      'username': username,
      'password': password
    });

    // ignore: avoid_print

    var jsonResponse = json.decode(response.body);
    print(jsonResponse);

    return jsonResponse;
  }

  Future generateOtp(String phone, String email) async {
    var client = http.Client();
    var uri = Uri.parse(UrlConfig.SEND_OTP);
    var response = await client.post(uri, headers: {
      // 'Content-Type': 'application/json; charset=UTF-8',
    }, body: {
      'phone': phone,
      'email': email
    });

    var jsonResponse = json.decode(response.body);

    return jsonResponse;
  }

  Future validateOtp(String phone, int otpCode) async {
    var client = http.Client();
    var uri = Uri.parse(UrlConfig.SEND_OTP);
    var response = await client.post(uri, headers: {
      // 'Content-Type': 'application/json; charset=UTF-8',
    }, body: {
      'phone': phone,
      'otpCode': otpCode
    });

    var jsonResponse = json.decode(response.body);

    return jsonResponse;
  }

  signout() async {
    var client = http.Client();
    var uri = Uri.parse(UrlConfig.SIGN_OUT);
    var response = await client.post(uri);

    // ignore: avoid_print

    var jsonResponse = json.decode(response.body);
    print(jsonResponse);

    return jsonResponse;
  }

  Future changePassword(String id, String password) async {
    var client = http.Client();
    var uri = Uri.parse("${UrlConfig.CHANGE_PASSWORD}/$id/$password");

    var response = await client.post(uri, headers: {
      // 'Content-Type': 'application/json; charset=UTF-8',
    });

    var jsonResponse = json.decode(response.body);

    return jsonResponse;
  }
}
