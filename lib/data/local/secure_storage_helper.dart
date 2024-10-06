import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';


import '../models/user/users.dart';

class SecureStorageHelper {
  // The value stored in SecureStore will not be deleted when the app is uninstalled.
  static const _apiTokenKey = 'api_token';
  static const _userInfo = 'user_info';
  static const _username = 'username';
  static const _password = 'password';

  final FlutterSecureStorage _storage;

  SecureStorageHelper._(this._storage);

  static final SecureStorageHelper _instance =
      SecureStorageHelper._(const FlutterSecureStorage());

  static SecureStorageHelper get instance => _instance;

  //Save token
  void saveToken(String token) async {
    await _storage.write(key: _apiTokenKey, value: token);
  }

  //Remove token
  void removeToken() async {
    await _storage.delete(key: _apiTokenKey);
  }

  //Get token
  Future<String?> getToken() async {
    try {
      //If it is the first time opening the app after installation, the value in SecureStore will be deleted.
      // final isFirstRun = await SharedPreferencesManager().getIsFirstLaunch();
      // if (isFirstRun) {
      //   removeToken();
      //   return null;
      // }
      final tokenEncoded = await _storage.read(key: _apiTokenKey);
      if (tokenEncoded == null) {
        return null;
      }
      return tokenEncoded;
    } catch (e) {
      return null;
    }
  }

  //Save token
  Future saveUserInfo(Auth auth) async {
    await _storage.write(key: _userInfo, value: jsonEncode(auth.toJson()));
  }

  //Remove token
  Future removeUserToken() async {
    await _storage.delete(key: _userInfo);
  }

  //Get token
  Future<Auth?> getUser() async {
    try {
      //If it is the first time opening the app after installation, the value in SecureStore will be deleted.
      // final isFirstRun = await SharedPreferencesManager().getIsFirstLaunch();
      // if (isFirstRun) {
      //   removeToken();
      //   return null;
      // }
      final userInfo = await _storage.read(key: _userInfo);
      if (userInfo == null) {
        return null;
      }
      return Auth.fromJson(jsonDecode(userInfo) as Map<String, dynamic>);
    } catch (e) {
      return null;
    }
  }

  Future getUsername() async {
    try {
      final username = await _storage.read(key: _username);
      if (username == null) {
        return null;
      }
      return username;
    } catch (e) {
      return null;
    }
  }

  Future getPassword() async {
    try {
      final password = await _storage.read(key: _password);
      if (password == null) {
        return null;
      }
      return password;
    } catch (e) {
      return null;
    }
  }

  Future saveLoginInfo(String username, String password) async {
    await _storage.write(key: _username, value: username);
    await _storage.write(key: _password, value: password);
  }

  Future removeLoginInfo() async {
    await _storage.delete(key: _username);
    await _storage.delete(key: _password);
  }
}
