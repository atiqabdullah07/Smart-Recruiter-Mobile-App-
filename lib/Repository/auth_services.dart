import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String loggedInKey = 'isLoggedIn';

  static Future<void> login(String username, String password) async {
    // Your authentication logic here
    // Example: verify credentials against a server
    // If successful, save the login status
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(loggedInKey, true);
  }

  static Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(loggedInKey, false);
  }

  static Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(loggedInKey) ?? false;
  }
}
