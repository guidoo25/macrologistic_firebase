import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Enviroments {
  initEnviroments() async {
    await dotenv.load(fileName: ".env");
  }

  static Color primaryColor = Colors.blueAccent;

  static String apiMap = dotenv.env['API_MAP'] ?? '';
  static String apiurl = dotenv.env['API_URL'] ?? '';
  static String apiUser = dotenv.env['email'] ?? '';
  static String apiPassword = dotenv.env['password'] ?? '';
  static String apiLaravel = dotenv.env['API_LARAVEL'] ?? '';
  static String apiNode = dotenv.env['API_NODE'] ?? '';

  static Future<String?> getTokentApiLaravel() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    return token;
  }
}
