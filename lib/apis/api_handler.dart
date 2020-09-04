import 'dart:async';
import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'api_exception.dart';
import 'package:contactapp/utils/logger.dart';

import 'package:http/http.dart' as http;

class ApiHandler {
  // next three lines makes this class a Singleton
  static final ApiHandler _instance = new ApiHandler.internal();
  final JsonDecoder _decoder = new JsonDecoder();

  ApiHandler.internal();

  factory ApiHandler() => _instance;

  Future<bool> isInternetConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  Future<dynamic> get(String url) async {
    Logger.print("====URL GET Call:   $url");
    // ignore: unrelated_type_equality_checks
    var isConnected = await isInternetConnected();
    if (isConnected != true) {
      return Future.error(ApiException("Strings.internetNotConnected"));
    }
    return http.get(url).then((http.Response response) {
      final int statusCode = response.statusCode;
      Logger.print("====response ${response.toString()}");

      if (statusCode < 200 || statusCode >= 400 || json == null) {
        throw new ApiException(jsonDecode(response.body)["message"]);
      }
      return _decoder.convert(response.body);
    });
  }

  Future<dynamic> post(String url, {Map headers, body, encoding}) async {
    Logger.print("====URL POST Call:   $url");
    Logger.print("====body :   $body");
    var isConnected = await isInternetConnected();
    if (isConnected != true) {
      return Future.error(ApiException("Strings.internetNotConnected"));
    }

    return http
        .post(url, body: body, headers: headers, encoding: encoding)
        .then((http.Response response) {
      final int statusCode = response.statusCode;
      Logger.print("====responseBody ${response.body.toString()}");
      Logger.print("====responseStatusCode ${response.statusCode}");

      if (statusCode < 200 || statusCode >= 400 || json == null) {
        throw new ApiException(jsonDecode(response.body)["message"]);
      }
      return _decoder.convert(response.body);
    });
  }
}
