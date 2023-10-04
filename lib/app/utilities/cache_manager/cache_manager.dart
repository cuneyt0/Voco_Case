import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  static CacheManager instance = CacheManager();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<bool> saveToken(String data) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(CacheManagerKey.token.toString(), data);

    return true;
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await _prefs;
    String? token = prefs.getString(CacheManagerKey.token.toString());
    print("TOKEN $token");
    return token;
  }

  Future<bool> removeToken() async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove(CacheManagerKey.token.toString());
    return true;
  }
}

enum CacheManagerKey { token }
