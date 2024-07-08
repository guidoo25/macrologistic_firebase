import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:macrologisticguatemala/config/enviroments.dart';

import 'package:macrologisticguatemala/models/reservas_response.dart';
import 'package:macrologisticguatemala/models/response_carreras.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<ReservasResponse>> getViajes(String userId) async {
  final response = await http.post(
    Uri.parse('${Enviroments.apiurl}/login/getReservasByUsuario'),
    body: {
      'iduser': userId.toString(),
    },
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
  );

  if (response.statusCode == 200) {
    final List<ReservasResponse> viajes =
        reservasResponseFromJson(response.body);
    return viajes;
  } else {
    throw Exception('Failed to load reservas');
  }
}

Future<List<CarrerasResponse>> getCarreras(
    String userId, String empresaId) async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  final data = {
    'id_user': empresaId,
    'id_chofer': userId,
  };
  final response =
      await http.post(Uri.parse('${Enviroments.apiLaravel}/get-reservas-info'),
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Authorization': 'Bearer ${token}'
          },
          body: data);

  if (response.statusCode == 200) {
    final List<CarrerasResponse> viajes =
        carrerasResponseFromJson(response.body);
    return viajes;
  } else {
    throw Exception('Error al cargar las reservas');
  }
}

final userIdProvider = FutureProvider<String>((ref) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('userid') ?? '';
});
final empresaIdProvider = FutureProvider<String>((ref) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('empresa') ?? '';
});

final carerrasProvider = FutureProvider<List<CarrerasResponse>>((ref) async {
  final userId = await ref.watch(userIdProvider.future);
  final empresa = await ref.watch(empresaIdProvider.future);
  return getCarreras(userId, empresa);
});

//final apiResponse = Provider<List<CarrerasResponse>> ((ref)=>getCarreras())


final viajesProvider = FutureProvider<List<ReservasResponse>>((ref) async {
  final userId = await ref.watch(userIdProvider.future);
  return getViajes(userId);
});
