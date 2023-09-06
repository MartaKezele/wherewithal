import 'package:shared_preferences/shared_preferences.dart';

Future<String?> fetchStringPref(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

void writeStringPref(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(
    key,
    value,
  );
}
