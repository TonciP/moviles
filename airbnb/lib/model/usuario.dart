// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({
    required this.email,
    required this.password,
    required this.telefono,
    required this.nombrecompleto,
  });

  String email;
  String password;
  String telefono;
  String nombrecompleto;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        email: json["email"],
        password: json["password"],
        telefono: json["telefono"],
        nombrecompleto: json["nombrecompleto"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "telefono": telefono,
        "nombrecompleto": nombrecompleto,
      };
}
