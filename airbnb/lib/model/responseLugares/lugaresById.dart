// To parse this JSON data, do
//
//     final getLugaresById = getLugaresByIdFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetLugaresById getLugaresByIdFromJson(String str) =>
    GetLugaresById.fromJson(json.decode(str));

String getLugaresByIdToJson(GetLugaresById data) => json.encode(data.toJson());

class GetLugaresById {
  GetLugaresById({
    required this.res,
    required this.data,
  });

  String res;
  Data data;

  factory GetLugaresById.fromJson(Map<String, dynamic> json) => GetLugaresById(
        res: json["res"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "res": res,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.cantPersonas,
    required this.cantCamas,
    required this.cantBanios,
    required this.cantHabitaciones,
    required this.tieneWifi,
    required this.cantVehiculosParqueo,
    required this.precioNoche,
    required this.costoLimpieza,
    required this.ciudad,
    required this.latitud,
    required this.longitud,
    required this.arrendatarioId,
    required this.createdAt,
    required this.updatedAt,
    required this.fotos,
  });

  int id;
  String nombre;
  String descripcion;
  int cantPersonas;
  int cantCamas;
  int cantBanios;
  int cantHabitaciones;
  int tieneWifi;
  int cantVehiculosParqueo;
  String precioNoche;
  String costoLimpieza;
  String ciudad;
  String latitud;
  String longitud;
  int arrendatarioId;
  DateTime createdAt;
  DateTime updatedAt;
  List<Foto> fotos;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        cantPersonas: json["cantPersonas"],
        cantCamas: json["cantCamas"],
        cantBanios: json["cantBanios"],
        cantHabitaciones: json["cantHabitaciones"],
        tieneWifi: json["tieneWifi"],
        cantVehiculosParqueo: json["cantVehiculosParqueo"],
        precioNoche: json["precioNoche"],
        costoLimpieza: json["costoLimpieza"],
        ciudad: json["ciudad"],
        latitud: json["latitud"],
        longitud: json["longitud"],
        arrendatarioId: json["arrendatario_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        fotos: List<Foto>.from(json["fotos"].map((x) => Foto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "cantPersonas": cantPersonas,
        "cantCamas": cantCamas,
        "cantBanios": cantBanios,
        "cantHabitaciones": cantHabitaciones,
        "tieneWifi": tieneWifi,
        "cantVehiculosParqueo": cantVehiculosParqueo,
        "precioNoche": precioNoche,
        "costoLimpieza": costoLimpieza,
        "ciudad": ciudad,
        "latitud": latitud,
        "longitud": longitud,
        "arrendatario_id": arrendatarioId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "fotos": List<dynamic>.from(fotos.map((x) => x.toJson())),
      };
}

class Foto {
  Foto({
    required this.id,
    required this.lugarId,
    required this.url,
  });

  int id;
  int lugarId;
  String url;

  factory Foto.fromJson(Map<String, dynamic> json) => Foto(
        id: json["id"],
        lugarId: json["lugar_id"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lugar_id": lugarId,
        "url": url,
      };
}
