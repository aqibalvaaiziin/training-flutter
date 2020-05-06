import 'package:shared_preferences/shared_preferences.dart';

class PreferencesData {
  Future<String> getDataToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String stringValue = preferences.getString("token");
    return stringValue;
  }

  Future<String> getDataTokenType() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String stringValue = preferences.getString("type");
    return stringValue;
  }

  Future setDataToken(String data) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("token", data);
  }

  Future setDataTokenType(String data) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("type", data);
  }
}
