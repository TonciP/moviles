// To parse this JSON data, do
//
//     final buscarCiudad = buscarCiudadFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BuscarCiudad buscarCiudadFromJson(String str) =>
    BuscarCiudad.fromJson(json.decode(str));

String buscarCiudadToJson(BuscarCiudad data) => json.encode(data.toJson());

class BuscarCiudad {
  BuscarCiudad({
    required this.ciudad,
    required this.fechaInicio,
    required this.fechaFin,
    required this.cantPersonas,
  });

  String ciudad;
  DateTime fechaInicio;
  DateTime fechaFin;
  int cantPersonas;

  factory BuscarCiudad.fromJson(Map<String, dynamic> json) => BuscarCiudad(
        ciudad: json["ciudad"] ?? "",
        fechaInicio: DateTime.parse(json["fechaInicio"]),
        fechaFin: DateTime.parse(json["fechaFin"]),
        cantPersonas: json["cantPersonas"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "ciudad": ciudad,
        "fechaInicio":
            "${fechaInicio.year.toString().padLeft(4, '0')}-${fechaInicio.month.toString().padLeft(2, '0')}-${fechaInicio.day.toString().padLeft(2, '0')}",
        "fechaFin":
            "${fechaFin.year.toString().padLeft(4, '0')}-${fechaFin.month.toString().padLeft(2, '0')}-${fechaFin.day.toString().padLeft(2, '0')}",
        "cantPersonas": cantPersonas,
      };
}
