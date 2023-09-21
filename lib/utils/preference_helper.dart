import 'package:shared_preferences/shared_preferences.dart';

/// The class which contains the shared preferences related utils.
class SharedPreferenceHelper {
  /// The instance of [SharedPreferenceHelper]
  static final SharedPreferenceHelper _instance =
      SharedPreferenceHelper._internal();

  /// [_prefs] is a private variable which is used to store the instance of
  /// [SharedPreferences].
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  /// Returns the instance of [SharedPreferenceHelper]
  factory SharedPreferenceHelper() {
    return _instance;
  }

  SharedPreferenceHelper._internal();

  static const localData = 'localData';

  Future<void> saveLocalData({required String value}) async {
    final SharedPreferences preferences = await _prefs;
    await preferences.setString(localData, value);
  }

  Future<String> getLocalData() async {
    final SharedPreferences preferences = await _prefs;
    return preferences.getString(localData) ?? "";
  }

  /// [clearAll] is a method which is used to save the token in the
  Future<void> clearAll() async {
    final SharedPreferences preferences = await _prefs;
    await preferences.clear();
  }
}
