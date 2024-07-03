import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:macrologisticguatemala/config/enviroments.dart';
import 'package:macrologisticguatemala/models/auth_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthState {
  AuthState({required this.autenticando});

  bool autenticando;
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState(autenticando: false));
  Future<bool> login(String email, String password) async {
    state = AuthState(autenticando: true);
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    print('token: $token');
    final data = {
      'usuario': email,
      'password': password,
    };

    final uri = Uri.parse('${Enviroments.apiLaravel}/getUserLogin');
    final resp = await http.post(
      uri,
      body: data,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer ${token}'
      },
    );

    state = AuthState(autenticando: false);

    if (resp.statusCode == 200) {
      try {
        final loginResponse = authResponseFromJson(resp.body);

        await this._guardarData(
            //TODO: SI SE REQUIERE GUARDAR ID ADCIONALES AQUI
            loginResponse.idEmpresa.toString(),
            loginResponse.idUsuario.toString());
        //loginResponse.data.idUsuario.toString());
        return true;
      } catch (e) {
        print("Error al deserializar la respuesta: $e");
        return false;
      }
    } else {
      return false;
    }
  }

  Future<void> _guardarData(String empresa, String userid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('empresa', empresa);
    await prefs.setString('userid', userid);
  }

  // Future<void> _guardarToken(
  //     String role, String solicitante, int userid) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('role', role);
  //   await prefs.setString('sol', solicitante);
  //   await prefs.setInt('userid', userid);
  // }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});
final columnProvider = StateProvider<int>((ref) => 0);
