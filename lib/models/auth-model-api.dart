// To parse this JSON data, do
//
//     final authResponseApi = authResponseApiFromJson(jsonString);

import 'dart:convert';

AuthResponseApi authResponseApiFromJson(String str) => AuthResponseApi.fromJson(json.decode(str));

String authResponseApiToJson(AuthResponseApi data) => json.encode(data.toJson());

class AuthResponseApi {
  String accessToken;
  String tokenType;

  AuthResponseApi({
    required this.accessToken,
    required this.tokenType,
  });

  factory AuthResponseApi.fromJson(Map<String, dynamic> json) => AuthResponseApi(
    accessToken: json["access_token"],
    tokenType: json["token_type"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "token_type": tokenType,
  };
}
