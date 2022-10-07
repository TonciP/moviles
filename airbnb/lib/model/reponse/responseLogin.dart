// To parse this JSON data, do
//
//     final reponseLogin = reponseLoginFromJson(jsonString);

import 'dart:convert';

ReponseLogin reponseLoginFromJson(String str) =>
    ReponseLogin.fromJson(json.decode(str));

String reponseLoginToJson(ReponseLogin data) => json.encode(data.toJson());

class ReponseLogin {
  ReponseLogin({
    required this.res,
    required this.data,
  });

  String res;
  Data data;

  factory ReponseLogin.fromJson(Map<String, dynamic> json) => ReponseLogin(
        res: json["res"],
        data: json["data"] != null
            ? Data.fromJson(json["data"])
            : Data(
                id: 0,
                email: "",
                password: "",
                nombrecompleto: "",
                telefono: "",
                createdAt: new DateTime(0, 0, 0),
                updatedAt: new DateTime(0, 0, 0)),
      );

  Map<String, dynamic> toJson() => {
        "res": res,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.email,
    required this.password,
    required this.nombrecompleto,
    required this.telefono,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String email;
  String password;
  String nombrecompleto;
  String telefono;
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        nombrecompleto: json["nombrecompleto"],
        telefono: json["telefono"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "nombrecompleto": nombrecompleto,
        "telefono": telefono,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
