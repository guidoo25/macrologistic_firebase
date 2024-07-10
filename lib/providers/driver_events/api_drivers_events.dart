
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:macrologisticguatemala/config/enviroments.dart';
import 'package:macrologisticguatemala/models/driver_events.dart';
import 'package:shared_preferences/shared_preferences.dart';

final eventPickupBlockProvider = StateProvider<bool>((ref) => false);
final eventArrivoBlockProvider = StateProvider<bool>((ref) => false);

class ApiDriverEvents {
  final baseUrl = Enviroments.apiurl;

    Future<String?> obtenerTokenGuardado() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    return token;
  }

Future<void> UltimoDriverEvent(int id_reserva) async{
    //TODO: IMPLEMENTAR CON URL DE LA BASE CON EL ULTIMO EVENTO EJCUTADO EN ESA RESERVA
    final url = Uri.parse('${baseUrl}/events/lastEvent/${id_reserva}');
    final token = obtenerTokenGuardado();
    http.get(url, headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer ${token}'
    }).then((response) {
      print(response.body);
    });
    
  }



  Future<void> EventPickup(DriverEventsModel detalles) async {
    try {
      final url = Uri.parse('${baseUrl}/events/departedToPickup');
  
      final detallesJson = jsonEncode(detalles);
      print(detallesJson);
      final token = await obtenerTokenGuardado();
  
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token'
        },
        body: detallesJson,
      );
  
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception caught: $e');
    }
  }

  Future<void> EventArrivo(DriverEventsModel eventos) async {
    final url = Uri.parse('${baseUrl}/events/arrivedAtPickup');

    final eventosJson = jsonEncode(eventos);
    print(eventosJson);
    final token = await obtenerTokenGuardado();


    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer ${token}'
      },
      body: eventosJson,
    );

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('Error: ${response.statusCode}');
    }
  }


  Future<void> EventCustomerNoShow(DriverEventsModel eventos) async {
    final url = Uri.parse('${baseUrl}/events/customerNoShow');

    final eventosJson = jsonEncode(eventos);
    print(eventosJson);
    final token = await obtenerTokenGuardado();
  

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer ${token}'

      },
      body: eventosJson,
    );

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('Error: ${response.statusCode}');
    }
  }

    Future<void> EventdepartedDrop(DriverEventsModel eventos) async {
    final url = Uri.parse('${baseUrl}/events/departedToDropOff');

    final eventosJson = jsonEncode(eventos);
    print(eventosJson);
    final token = await obtenerTokenGuardado();


    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization: Bearer': 'Bearer ${token}'
      },
      body: eventosJson,
    );

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('Error: ${response.statusCode}');
    }
  }
  
    Future<void> EventArrivaDrop(DriverEventsModel eventos) async {
    final url = Uri.parse('${baseUrl}/events/arrivedAtDropOff');

    final eventosJson = jsonEncode(eventos);
    print(eventosJson);
    final token = await obtenerTokenGuardado();


    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer ${token}'
      },
      body: eventosJson,
    );

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('Error: ${response.statusCode}');
    }
  }

   Future<void> EventLivelocation(DriverEventsModel eventos) async {
    final url = Uri.parse('${baseUrl}/events/liveLocation');

    final eventosJson = jsonEncode(eventos);
    print(eventosJson);
    final token = await obtenerTokenGuardado();

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer ${token}'
      },
      body: eventosJson,
    );

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('Error: ${response.statusCode}');
    }
  }


 
}