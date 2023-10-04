import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:voco_case/app/data_provider/model/signIn/signIn.dart';

class CacheManager {
  static CacheManager instance = CacheManager();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<bool> saveLoginResponse(SignIn data) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(
        CacheManagerKey.token.toString(), jsonEncode(data.toJson()));

    return true;
  }

  Future<String?> getToken({String? token}) async {
    final SharedPreferences prefs = await _prefs;
    String? token = prefs.getString(CacheManagerKey.token.toString());

    return token;
  }

  Future<bool> removeToken() async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove(CacheManagerKey.token.toString());

    return true;
  }
}

enum CacheManagerKey { token }
