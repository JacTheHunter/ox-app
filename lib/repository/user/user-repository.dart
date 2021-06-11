import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fuckingnum/repository/api-constants.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import 'package:shared_preferences/shared_preferences.dart';

class UserRepository extends ApiConstants {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static UserRepository getInstance() {
    return UserRepository();
  }

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    Map<String, String> body = {
      '_username': username,
      '_password': password,
      '_subdomain': 'face',
    };

    try {
      var dio = Dio();

      print(
          'DIO >>>>>>>>>>>>>>>>> auth checking................. >>>>>>>>>>>>>>>>>>>>>>>>>>');

      var response = await dio.post(ApiConstants.auth_check,
          data: body,
          options: new Options(
              contentType:
                  ContentType.parse("application/x-www-form-urlencoded")
                      .toString()));
      print(
          'DIO >>>>>>>>>>>>>>>>> auth checked................. >>>>>>>>>>>>>>>>>>>>>>>>>>');
      var token = response.data['token'];
      return token;
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteToken() async {
    var sharedPreferences = await _prefs;
    await sharedPreferences.remove('token');
    return;
  }

  Future<void> persistToken(String token) async {
    var sharedPreferences = await _prefs;

    await sharedPreferences.setString('token', token);
    return;
  }

  Future<bool> hasToken() async {
    var sharedPreferences = await _prefs;

    var s = await sharedPreferences.getString('token');
    return s == null ? false : true;
  }
}
