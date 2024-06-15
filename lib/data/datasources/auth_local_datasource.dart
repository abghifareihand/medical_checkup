import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_response_model.dart';

class AuthLocalDatasource {
  static const String authKey = 'authKey';

  Future<bool> saveAuthData(UserResponseModel userResponse) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setString(authKey, userResponse.toJson());
  }

  Future<bool> removeAuthData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.remove(authKey);
  }

  Future<bool> isLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final authJson = pref.getString(authKey) ?? '';
    return authJson.isNotEmpty;
  }

  Future<String> getRole() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final authJson = pref.getString(authKey) ?? '';
    final authModel = UserResponseModel.fromJson(authJson);
    return authModel.role;
  }
}
