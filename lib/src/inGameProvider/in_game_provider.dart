import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:in_game/src/models/http_result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InGameProvider {
  static const baseUrl = "https://kasbiytalim.uz/api/v1/";

  static Future<HttpResult> _postUrl(String url, data) async {
    http.Response response = await http.post(
      Uri.parse(url),
      body: data,
      headers: await _header(),
    );
    return _result(response);
  }

  static Future<HttpResult> _getUrl(String url) async {
    print(url);
    http.Response response = await http.get(
      Uri.parse(url),
      headers: await _header(),
    );
    return _result(response);
  }

  static HttpResult _result(http.Response data) {
    print(data.body);
    if (data.statusCode >= 200 && data.statusCode <= 299) {
      return HttpResult(
        success: true,
        code: data.statusCode,
        result: json.decode(
          utf8.decode(data.bodyBytes),
        ),
      );
    } else {
      return HttpResult(
        success: false,
        code: data.statusCode,
        result: {},
      );
    }
  }

  static Future<Map<String, String>> _header() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token") ?? "";
    if (prefs.getString("token") == null) {
      return {};
    } else {
      return {
        "Authorization": "Bearer $token",
      };
    }
  }

  /// login
  Future<HttpResult> loginApi(String login, String password) async {
    var data = {
      "phone": login,
      "password": password,
    };
    return await _postUrl(baseUrl + "login/", data);
  }

  /// register
  Future<HttpResult> registerApi(
      String password,
      String fullName,
      String conPas,
      String phone,
      ) async {
    var data = {
      "password": password,
      "full_name": fullName,
      "confirm_password": conPas,
      "phone": phone,
    };
    return await _postUrl(baseUrl + "register/", data);
  }

  /// info
  Future<HttpResult> getUserApi() async {
    return await _getUrl(baseUrl + "get-user/");
  }

  /// Club
  Future<HttpResult> getClub() async {
    return await _getUrl(baseUrl + "football-club/");
  }

  ///Game-End
  Future<HttpResult> getGameEndApi() async{
    return await _getUrl(baseUrl + "game-end/");
  }

  ///Pitches
  Future<HttpResult> getPitchesApi() async{
    return await _getUrl(baseUrl + "pitch");
  }
}