// To parse this JSON data, do
//
//     final carrerasResponse = carrerasResponseFromJson(jsonString);

import 'dart:convert';

List<CarrerasResponse> carrerasResponseFromJson(String str) =>
    List<CarrerasResponse>.from(
        json.decode(str).map((x) => CarrerasResponse.fromJson(x)));

String carrerasResponseToJson(List<CarrerasResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CarrerasResponse {
  int idReserva;
  int motoresReservaId;
  String referenciaCliente;
  String refrenciaReserva;
  String codReferencia;
  String hashReserva;
  DateTime fechaReserva;
  DateTime fechaInicioReserva;
  dynamic precioMotor;
  String precioEmpresa;
  dynamic precioGananciaNeta;
  dynamic porcentajeGanancia;
  String puntoLlegadaCarreraLongitud;
  String puntoLlegadaCarreraLatitud;
  String puntoInicioCarreraLongitud;
  String puntoInicioCarreraLatitud;
  String informacionClienteNombres;
  String informacionClienteTelefono;
  dynamic informacionClienteAdicional;
  dynamic idConductor;
  String reservaDriverId;
  dynamic reservaAceptadaPor;
  DateTime fechaAceptacion;
  int estadoReserva;
  int estadoDriverReserva;
  int empresaId;
  int motorId;
  String porcentajeGananciaMotor;
  dynamic codigoProveedor;
  String? direccion_llegada;
  String? direccion_recogida;
  int idUser;

  CarrerasResponse({
    required this.idReserva,
    required this.motoresReservaId,
    required this.referenciaCliente,
    required this.refrenciaReserva,
    required this.codReferencia,
    required this.hashReserva,
    required this.fechaReserva,
    required this.fechaInicioReserva,
    required this.precioMotor,
    required this.precioEmpresa,
    required this.precioGananciaNeta,
    required this.porcentajeGanancia,
    required this.puntoLlegadaCarreraLongitud,
    required this.puntoLlegadaCarreraLatitud,
    required this.puntoInicioCarreraLongitud,
    required this.puntoInicioCarreraLatitud,
    required this.informacionClienteNombres,
    required this.informacionClienteTelefono,
    required this.informacionClienteAdicional,
    required this.idConductor,
    required this.reservaDriverId,
    required this.reservaAceptadaPor,
    required this.fechaAceptacion,
    required this.estadoReserva,
    required this.estadoDriverReserva,
    required this.empresaId,
    required this.motorId,
    required this.porcentajeGananciaMotor,
    required this.codigoProveedor,
    required this.idUser,
     required this.direccion_llegada,
    required  this.direccion_recogida,
  });

  factory CarrerasResponse.fromJson(Map<String, dynamic> json) =>
      CarrerasResponse(
        idReserva: json["id_reserva"],
        motoresReservaId: json["motores_reserva_id"],
        referenciaCliente: json["referencia_cliente"],
        refrenciaReserva: json["refrencia_reserva"],
        codReferencia: json["cod_referencia"],
        hashReserva: json["hash_reserva"],
        fechaReserva: DateTime.parse(json["fecha_reserva"]),
        fechaInicioReserva: DateTime.parse(json["fecha_inicio_reserva"]),
        precioMotor: json["precio_motor"],
        precioEmpresa: json["precio_empresa"],
        precioGananciaNeta: json["precio_ganancia_neta"],
        porcentajeGanancia: json["porcentaje_ganancia"],
        puntoLlegadaCarreraLongitud: json["punto_llegada_carrera_longitud"],
        puntoLlegadaCarreraLatitud: json["punto_llegada_carrera_latitud"],
        puntoInicioCarreraLongitud: json["punto_inicio_carrera_longitud"],
        puntoInicioCarreraLatitud: json["punto_inicio_carrera_latitud"],
        informacionClienteNombres: json["informacion_cliente_nombres"],
        informacionClienteTelefono: json["informacion_cliente_telefono"],
        informacionClienteAdicional: json["informacion_cliente_adicional"],
        idConductor: json["id_conductor"],
        reservaDriverId: json["reserva_driver_id"],
        reservaAceptadaPor: json["reserva_aceptada_por"],
        fechaAceptacion: DateTime.parse(json["fecha_aceptacion"]),
        estadoReserva: json["estado_reserva"],
        estadoDriverReserva: json["estado_driver_reserva"],
        empresaId: json["empresa_id"],
        motorId: json["motor_id"],
        porcentajeGananciaMotor: json["porcentaje_ganancia_motor"],
        codigoProveedor: json["codigo_proveedor"],
        idUser: json["id_user"],
        direccion_llegada: json["direccion_llegada"],
        direccion_recogida: json["direccion_recogida"],
      );

  Map<String, dynamic> toJson() => {
        "id_reserva": idReserva,
        "motores_reserva_id": motoresReservaId,
        "referencia_cliente": referenciaCliente,
        "refrencia_reserva": refrenciaReserva,
        "cod_referencia": codReferencia,
        "hash_reserva": hashReserva,
        "fecha_reserva": fechaReserva.toIso8601String(),
        "fecha_inicio_reserva": fechaInicioReserva.toIso8601String(),
        "precio_motor": precioMotor,
        "precio_empresa": precioEmpresa,
        "precio_ganancia_neta": precioGananciaNeta,
        "porcentaje_ganancia": porcentajeGanancia,
        "punto_llegada_carrera_longitud": puntoLlegadaCarreraLongitud,
        "punto_llegada_carrera_latitud": puntoLlegadaCarreraLatitud,
        "punto_inicio_carrera_longitud": puntoInicioCarreraLongitud,
        "punto_inicio_carrera_latitud": puntoInicioCarreraLatitud,
        "informacion_cliente_nombres": informacionClienteNombres,
        "informacion_cliente_telefono": informacionClienteTelefono,
        "informacion_cliente_adicional": informacionClienteAdicional,
        "id_conductor": idConductor,
        "reserva_driver_id": reservaDriverId,
        "reserva_aceptada_por": reservaAceptadaPor,
        "fecha_aceptacion": fechaAceptacion.toIso8601String(),
        "estado_reserva": estadoReserva,
        "estado_driver_reserva": estadoDriverReserva,
        "empresa_id": empresaId,
        "motor_id": motorId,
        "porcentaje_ganancia_motor": porcentajeGananciaMotor,
        "codigo_proveedor": codigoProveedor,
        "id_user": idUser,
        "direccion_llegada": direccion_llegada,
        "direccion_recogida": direccion_recogida,
      };
}
