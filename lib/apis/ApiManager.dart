import 'dart:convert';

import 'package:contactapp/models/signin/SignInResponse.dart';

import 'UrlConstants.dart';
import 'api_handler.dart';

class ApiManager {
  // next three lines makes this class a Singleton
  static ApiManager _instance = new ApiManager.internal();

  ApiManager.internal();

  factory ApiManager() => _instance;

  static ApiHandler _handler;

  static void init() {
    _handler = new ApiHandler();
  }

 static Future<SignInResponse> loginApi(Map<String, dynamic> mapData) {
   String body = json.encode(mapData);
   return _handler.post(UrlConstants.loginUrl, body: body).then((res) {
     return SignInResponse.fromJson(res);
   });
 }

// static Future<SignUpResponse> signUpApi(Map<String, dynamic> req) {
//   return _handler.post(UrlConstants.SIGN_UP_URL, body: req).then((res) {
//     return SignUpResponse.fromJson(res);
//   });
// }

// static Future<SendOTPRes> sendOtp(Map<String, dynamic> req) {
//   return _handler.post(UrlConstants.SEND_OTP, body: json.encode(req)).then((res) {
//     return SendOTPRes.fromJson(res);
//   });
// }
}