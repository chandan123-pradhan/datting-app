import 'package:dating_app/Models/userdata_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // for encoding/decoding JSON

class SharedPreferencesHelper {
  static const String isRegisterKey = 'isRegister';
  static const String tokenKey = 'token';
  static const String userDataKey = 'userData';

  static Future<void> saveUserInformation({
     bool? isRegister,
     String? token,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(isRegisterKey, isRegister??false);
    prefs.setString(tokenKey, token??'');
  }

  static Future<void> saveUserData({
    UserData? userData,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final userDataJson = json.encode(userData?.toJson());
    prefs.setString(userDataKey, userDataJson);
  }

  static Future<bool> getIsRegister() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isRegisterKey) ?? false;
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(tokenKey);
  }

  static Future<UserDataModel?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userDataJson = prefs.getString(userDataKey);
    if (userDataJson != null) {
      return UserDataModel.fromJson(json.decode(userDataJson));
    }
    return null;
  }
}
