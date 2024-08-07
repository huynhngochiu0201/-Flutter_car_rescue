import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const String accessTokenKey = 'accessToken';
  static const String hasSeenOnboardingKey = 'hasSeenOnboarding';
  static const String userUidKey = 'userUid';

  static late SharedPreferences _prefs;

  static Future<void> initialise() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String? get token {
    return _prefs.getString(accessTokenKey);
  }

  static set token(String? token) =>
      _prefs.setString(accessTokenKey, token ?? '');

  static bool get isLogin =>
      _prefs.getString(accessTokenKey)?.isNotEmpty ?? false;

  static bool get hasSeenOnboarding {
    return _prefs.getBool(hasSeenOnboardingKey) ?? false;
  }

  static set hasSeenOnboarding(bool value) =>
      _prefs.setBool(hasSeenOnboardingKey, value);

  static String? get userUid {
    return _prefs.getString(userUidKey);
  }

  static set userUid(String? uid) => _prefs.setString(userUidKey, uid ?? '');

  static Future<void> removeToken() async {
    await _prefs.remove(accessTokenKey);
  }

  static Future<void> removeUserUid() async {
    await _prefs.remove(userUidKey);
  }
}
