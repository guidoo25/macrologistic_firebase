// To parse this JSON data, do
//
//     final authResponse = authResponseFromJson(jsonString);

import 'dart:convert';

AuthResponse authResponseFromJson(String str) =>
    AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  int idUsuario;
  String correo;
  int idEmpresa;
  List<dynamic> drives;

  AuthResponse({
    required this.idUsuario,
    required this.correo,
    required this.idEmpresa,
    required this.drives,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        idUsuario: json["id_usuario"],
        correo: json["correo"],
        idEmpresa: json["id_empresa"],
        drives: List<dynamic>.from(json["drives"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id_usuario": idUsuario,
        "correo": correo,
        "id_empresa": idEmpresa,
        "drives": List<dynamic>.from(drives.map((x) => x)),
      };
}
