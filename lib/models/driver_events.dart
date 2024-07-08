// To parse this JSON data, do
//
//     final driverEventsModel = driverEventsModelFromJson(jsonString);

import 'dart:convert';

DriverEventsModel driverEventsModelFromJson(String str) => DriverEventsModel.fromJson(json.decode(str));

String driverEventsModelToJson(DriverEventsModel data) => json.encode(data.toJson());

class DriverEventsModel {
    String customerReference;
    String bookingReference;
    double latitude;
    double longitude;
    String driverId;
    int idReserva;

    DriverEventsModel({
        required this.customerReference,
        required this.bookingReference,
        required this.latitude,
        required this.longitude,
        required this.driverId,
        required this.idReserva,
    });

    factory DriverEventsModel.fromJson(Map<String, dynamic> json) => DriverEventsModel(
        customerReference: json["customerReference"],
        bookingReference: json["bookingReference"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        driverId: json["driver_id"],
        idReserva: json["id_reserva"],
    );

    Map<String, dynamic> toJson() => {
        "customerReference": customerReference,
        "bookingReference": bookingReference,
        "latitude": latitude,
        "longitude": longitude,
        "driver_id": driverId,
        "id_reserva": idReserva,
    };
}
