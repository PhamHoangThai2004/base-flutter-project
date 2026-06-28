import 'package:shared_preferences/shared_preferences.dart';

part 'preferences_keys.dart';

class AppPreferences {
  AppPreferences._();

  static final instance = AppPreferences._();

  late final SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Save, get accessToken
  String get accessToken {
    return _prefs.getString(PreferencesKey.accessToken) ?? '';
  }

  Future<bool> saveAccessToken(String token) {
    return _prefs.setString(PreferencesKey.accessToken, token);
  }

  /// Save, get refreshToken
  String get refreshToken {
    return _prefs.getString(PreferencesKey.refreshToken) ?? '';
  }

  Future<bool> saveRefreshToken(String token) {
    return _prefs.setString(PreferencesKey.refreshToken, token);
  }
}