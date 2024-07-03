// To parse this JSON data, do
//
//     final reservasResponse = reservasResponseFromJson(jsonString);

import 'dart:convert';

List<ReservasResponse> reservasResponseFromJson(String str) =>
    List<ReservasResponse>.from(
        json.decode(str).map((x) => ReservasResponse.fromJson(x)));

String reservasResponseToJson(List<ReservasResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReservasResponse {
  int idReserva;
  String codigo;
  DateTime fechaInicio;
  DateTime fechaFin;
  String estado;
  String descripcionFin;
  String descripcionInicio;
  String latitudDestino;
  String longitudDestino;
  String latitudOrigen;
  String longitdOrigen;
  String latitudIntermedio;
  String longitudIntermedio;

  ReservasResponse({
    required this.idReserva,
    required this.codigo,
    required this.fechaInicio,
    required this.fechaFin,
    required this.estado,
    required this.descripcionFin,
    required this.descripcionInicio,
    required this.latitudDestino,
    required this.longitudDestino,
    required this.latitudOrigen,
    required this.longitdOrigen,
    required this.latitudIntermedio,
    required this.longitudIntermedio,
  });

  factory ReservasResponse.fromJson(Map<String, dynamic> json) =>
      ReservasResponse(
        idReserva: json["id_reserva"],
        codigo: json["codigo"],
        fechaInicio: DateTime.parse(json["fecha_inicio"]),
        fechaFin: DateTime.parse(json["fecha_fin"]),
        estado: json["estado"],
        descripcionFin: json["descripcion_fin"],
        descripcionInicio: json["descripcion_inicio"],
        latitudDestino: json["latitud_destino"],
        longitudDestino: json["longitud_destino"],
        latitudOrigen: json["latitud_origen"],
        longitdOrigen: json["longitd_origen"],
        latitudIntermedio: json["latitud_intermedio"],
        longitudIntermedio: json["longitud_intermedio"],
      );

  Map<String, dynamic> toJson() => {
        "id_reserva": idReserva,
        "codigo": codigo,
        "fecha_inicio":
            "${fechaInicio.year.toString().padLeft(4, '0')}-${fechaInicio.month.toString().padLeft(2, '0')}-${fechaInicio.day.toString().padLeft(2, '0')}",
        "fecha_fin":
            "${fechaFin.year.toString().padLeft(4, '0')}-${fechaFin.month.toString().padLeft(2, '0')}-${fechaFin.day.toString().padLeft(2, '0')}",
        "estado": estado,
        "descripcion_fin": descripcionFin,
        "descripcion_inicio": descripcionInicio,
        "latitud_destino": latitudDestino,
        "longitud_destino": longitudDestino,
        "latitud_origen": latitudOrigen,
        "longitd_origen": longitdOrigen,
        "latitud_intermedio": latitudIntermedio,
        "longitud_intermedio": longitudIntermedio,
      };
}