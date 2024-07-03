import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:macrologisticguatemala/config/enviroments.dart';
import 'package:macrologisticguatemala/models/auth-model-api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthState {
  AuthState({required this.autenticando});

  bool autenticando;
}

class AuthNotifierLocal extends StateNotifier<AuthState> {
  AuthNotifierLocal() : super(AuthState(autenticando: false));

  Future<bool> login() async {
    state = AuthState(autenticando: true);

    final data = {
      'email': Enviroments.apiUser,
      'password': Enviroments.apiPassword,
    };

    final uri = Uri.parse('${Enviroments.apiLaravel}/login');
    final resp = await http.post(
      uri,
      body: data,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );

    state = AuthState(autenticando: false);

    if (resp.statusCode == 200) {
      final loginResponse = authResponseApiFromJson(resp.body);

      await guardarData(loginResponse.accessToken); // Hacer público el método

      return true;
    } else {
      return false;
    }
  }

  // Hacer público el método y opcionalmente estático si es necesario
  static Future<void> guardarData(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String?> obtenerTokenGuardado() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    return token;
  }

// Future<void> _guardarToken(
//     String role, String solicitante, int userid) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setString('role', role);
//   await prefs.setString('sol', solicitante);
//   await prefs.setInt('userid', userid);
// }
}

final authProvider = StateNotifierProvider<AuthNotifierLocal, AuthState>((ref) {
  return AuthNotifierLocal();
});
final columnProvider = StateProvider<int>((ref) => 0);
