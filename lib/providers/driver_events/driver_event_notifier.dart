import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macrologisticguatemala/config/enviroments.dart';
import 'package:macrologisticguatemala/models/driver_events.dart';
import 'package:macrologisticguatemala/providers/driver_events/api_drivers_events.dart';
import 'package:http/http.dart' as http;



class EventPickupStatus {
  final bool success;
  

  EventPickupStatus({required this.success});
}

class EventPickupNotifier extends StateNotifier<EventPickupStatus> {
  EventPickupNotifier() : super(EventPickupStatus(success:false));

  Future<bool> eventPickup(DriverEventsModel detalles) async {
    state = EventPickupStatus(success: true); 
  
    try {
      //final url = Uri.parse('${Enviroments.apiLaravel}/events/departedToPickup');
       final url = Uri.parse('http://localhost:3000/api/event');
  
      final detallesMap = {
        "customerReference": detalles.customerReference,
        "bookingReference": detalles.bookingReference,
         "id_reserva":detalles.idReserva
        // "event_type": "DRIVER_LIVE_LOCATION",
        // "latitude": detalles.latitude,
        // "longitude": detalles.longitude,
        // "driver_id": detalles.driverId, 
        // "occurred_at": "2024-11-17T12:05:01Z",
        // "id_reserva": detalles.idReserva
      };
  
      final detallesJson = jsonEncode(detallesMap);
      print (detallesJson);
      final token = await ApiDriverEvents().obtenerTokenGuardado();
      state = EventPickupStatus(success: false);

  
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json', 
          // 'Authorization': 'Bearer $token'
        },
        body: detallesJson,
      );
  
      if (response.statusCode == 200) {
        return true;     
      } else {
  return false;      }
    } catch (e) {
       return false;
    }
  }

    Future<bool> eventPickup1(DriverEventsModel detalles) async {
    state = EventPickupStatus(success: true); 
  
    try {
      //final url = Uri.parse('${Enviroments.apiLaravel}/events/departedToPickup');
       final url = Uri.parse('${Enviroments.apiNode}/eventpickup1');
  
      final detallesMap = {
        "customerReference": detalles.customerReference,
        "bookingReference": detalles.bookingReference,
        "id_reserva":detalles.idReserva
        // "event_type": "DRIVER_LIVE_LOCATION",
        // "latitude": detalles.latitude,
        // "longitude": detalles.longitude,
        // "driver_id": detalles.driverId, 
        // "occurred_at": "2024-11-17T12:05:01Z",
        // "id_reserva": detalles.idReserva
      };
  
      final detallesJson = jsonEncode(detallesMap);
      print (detallesJson);
      //final token = await ApiDriverEvents().obtenerTokenGuardado();
      state = EventPickupStatus(success: false);

  
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json', 
          // 'Authorization': 'Bearer $token'
        },
        body: detallesJson,
      );
  
      if (response.statusCode == 200) {
        return true;     
      } else {
  return false;      }
    } catch (e) {
       return false;
    }
  }

      Future<bool> eventPickup2(DriverEventsModel detalles) async {
    state = EventPickupStatus(success: true); 
  
    try {
      //final url = Uri.parse('${Enviroments.apiLaravel}/events/departedToPickup');
       final url = Uri.parse('${Enviroments.apiNode}/eventpickup2');
  
      final detallesMap = {
        "customerReference": detalles.customerReference,
        "bookingReference": detalles.bookingReference,
        "id_reserva":detalles.idReserva

        // "event_type": "DRIVER_LIVE_LOCATION",
        // "latitude": detalles.latitude,
        // "longitude": detalles.longitude,
        // "driver_id": detalles.driverId, 
        // "occurred_at": "2024-11-17T12:05:01Z",
        // "id_reserva": detalles.idReserva
      };
  
      final detallesJson = jsonEncode(detallesMap);
      print (detallesJson);
      //final token = await ApiDriverEvents().obtenerTokenGuardado();
      state = EventPickupStatus(success: false);

  
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json', 
          // 'Authorization': 'Bearer $token'
        },
        body: detallesJson,
      );
  
      if (response.statusCode == 200) {
        return true;     
      } else {
  return false;      }
    } catch (e) {
       return false;
    }
  }

    Future<bool> eventDropoff(DriverEventsModel detalles) async {
    state = EventPickupStatus(success: true); 
  
    try {
      //final url = Uri.parse('${Enviroments.apiLaravel}/events/departedToPickup');
       final url = Uri.parse('${Enviroments.apiNode}/eventdropoff1');
  
      final detallesMap = {
        "customerReference": detalles.customerReference,
        "bookingReference": detalles.bookingReference,
        

        // "event_type": "DRIVER_LIVE_LOCATION",
        // "latitude": detalles.latitude,
        // "longitude": detalles.longitude,
        // "driver_id": detalles.driverId, 
        // "occurred_at": "2024-11-17T12:05:01Z",
        // "id_reserva": detalles.idReserva
      };
  
      final detallesJson = jsonEncode(detallesMap);
      print (detallesJson);
      //final token = await ApiDriverEvents().obtenerTokenGuardado();
      state = EventPickupStatus(success: false);

  
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json', 
          // 'Authorization': 'Bearer $token'
        },
        body: detallesJson,
      );
  
      if (response.statusCode == 200) {
        return true;     
      } else {
  return false;      }
    } catch (e) {
       return false;
    }
  }

   Future<bool> eventDropoff2(DriverEventsModel detalles) async {
    state = EventPickupStatus(success: true); 
  
    try {
      //final url = Uri.parse('${Enviroments.apiLaravel}/events/departedToPickup');
       final url = Uri.parse('${Enviroments.apiNode}/eventdropoff2');
  
      final detallesMap = {
        "customerReference": detalles.customerReference,
        "bookingReference": detalles.bookingReference,
        // "event_type": "DRIVER_LIVE_LOCATION",
        // "latitude": detalles.latitude,
        // "longitude": detalles.longitude,
        // "driver_id": detalles.driverId, 
        // "occurred_at": "2024-11-17T12:05:01Z",
        // "id_reserva": detalles.idReserva
      };
  
      final detallesJson = jsonEncode(detallesMap);
      print (detallesJson);
      //final token = await ApiDriverEvents().obtenerTokenGuardado();
      state = EventPickupStatus(success: false);

  
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json', 
          // 'Authorization': 'Bearer $token'
        },
        body: detallesJson,
      );
  
      if (response.statusCode == 200) {
        return true;     
      } else {
  return false;      }
    } catch (e) {
       return false;
    }
  }

  //METODOS PARA API DE LRAVEL 

  //TODO: USAR CUANDO SE ARREGLE EL CONTROLADOR DE LA API DE LARAVEL 

  Future<bool> EventArrivo(DriverEventsModel events) async {
        state = EventPickupStatus(success: true); 
        try {
      final url = Uri.parse('${Enviroments.apiLaravel}/events/arrivedAtPickup');
  
      final detallesMap = {
        "customerReference": events.customerReference,
        "bookingReference": events.bookingReference,
        "latitude": events.latitude,
        "longitude": events.longitude,
        "driver_id": events.driverId, 
        "id_reserva": events.idReserva
      };
  
      final detallesJson = jsonEncode(detallesMap);
      final token = await ApiDriverEvents().obtenerTokenGuardado();
      state = EventPickupStatus(success: false);

  
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json', 
          'Authorization': 'Bearer $token'
        },
        body: detallesJson,
      );
  
      if (response.statusCode == 200) {
        return true;     
      } else {
  return false;      }
    } catch (e) {
       return false;
    }
   }

     Future<bool> EventCustomerNoShow(DriverEventsModel events) async {
        state = EventPickupStatus(success: true); 
        try {
      final url = Uri.parse('${Enviroments.apiLaravel}/events/customerNoShow');
      //TODO:IMPLEMENTAR EL ENVIO DE LA IMAGEN EN EL SERVER EN LA APP YA CARGA DESDE LA RAIZ DEL TELEFONO 
      final detallesMap = {
        "customerReference": events.customerReference,
        "bookingReference": events.bookingReference,
        "latitude": events.latitude,
        "longitude": events.longitude,
        "driver_id": events.driverId, 
        "id_reserva": events.idReserva
      };
  
      final detallesJson = jsonEncode(detallesMap);
      final token = await ApiDriverEvents().obtenerTokenGuardado();
      state = EventPickupStatus(success: false);

  
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: detallesJson,
      );
  
      if (response.statusCode == 200) {
        return true;     
      } else {
  return false;      }
    } catch (e) {
       return false;
    }
   }
        Future<bool> EventdepartedDrop(DriverEventsModel events) async {
        state = EventPickupStatus(success: true); 
        try {
      final url = Uri.parse('${Enviroments.apiLaravel}/events/departedToDropOff');
      final detallesMap = {
        "customerReference": events.customerReference,
        "bookingReference": events.bookingReference,
        "latitude": events.latitude,
        "longitude": events.longitude,
        "driver_id": events.driverId, 
        "id_reserva": events.idReserva
      };
  
      final detallesJson = jsonEncode(detallesMap);
      final token = await ApiDriverEvents().obtenerTokenGuardado();
      state = EventPickupStatus(success: false);

  
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json', 
          'Authorization': 'Bearer $token'
        },
        body: detallesJson,
      );
  
      if (response.statusCode == 200) {
        return true;     
      } else {
  return false;      }
    } catch (e) {
       return false;
    }
   }


        Future<bool> EventoArriveDropoff(DriverEventsModel events) async {
        state = EventPickupStatus(success: true); 
        try {
      final url = Uri.parse('${Enviroments.apiLaravel}/events/departedToDropOff');
      final detallesMap = {
        "customerReference": events.customerReference,
        "bookingReference": events.bookingReference,
        "latitude": events.latitude,
        "longitude": events.longitude,
        "driver_id": events.driverId, 
        "id_reserva": events.idReserva
      };
  
      final detallesJson = jsonEncode(detallesMap);
      final token = await ApiDriverEvents().obtenerTokenGuardado();
      state = EventPickupStatus(success: false);

  
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json', 
          'Authorization': 'Bearer $token'
        },
        body: detallesJson,
      );
  
      if (response.statusCode == 200) {
        return true;     
      } else {
  return false;      }
    } catch (e) {
       return false;
    }
   }


   

}

final eventPickupProvider = StateNotifierProvider<EventPickupNotifier, EventPickupStatus>((ref) => EventPickupNotifier());

