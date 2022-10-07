// To parse this JSON data, do
//
//     final postReserva = postReservaFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PostReserva postReservaFromJson(String str) =>
    PostReserva.fromJson(json.decode(str));

String postReservaToJson(PostReserva data) => json.encode(data.toJson());

class PostReserva {
  PostReserva({
    required this.lugarId,
    required this.clienteId,
    required this.fechaInicio,
    required this.fechaFin,
    required this.precioTotal,
    required this.precioLimpieza,
    required this.precioNoches,
    required this.precioServicio,
  });

  String lugarId;
  int clienteId;
  DateTime fechaInicio;
  DateTime fechaFin;
  String precioTotal;
  String precioLimpieza;
  String precioNoches;
  String precioServicio;

  factory PostReserva.fromJson(Map<String, dynamic> json) => PostReserva(
        lugarId: json["lugar_id"],
        clienteId: json["cliente_id"],
        fechaInicio: DateTime.parse(json["fechaInicio"]),
        fechaFin: DateTime.parse(json["fechaFin"]),
        precioTotal: json["precioTotal"],
        precioLimpieza: json["precioLimpieza"],
        precioNoches: json["precioNoches"],
        precioServicio: json["precioServicio"],
      );

  Map<String, dynamic> toJson() => {
        "lugar_id": lugarId,
        "cliente_id": clienteId,
        "fechaInicio":
            "${fechaInicio.year.toString().padLeft(4, '0')}-${fechaInicio.month.toString().padLeft(2, '0')}-${fechaInicio.day.toString().padLeft(2, '0')}",
        "fechaFin":
            "${fechaFin.year.toString().padLeft(4, '0')}-${fechaFin.month.toString().padLeft(2, '0')}-${fechaFin.day.toString().padLeft(2, '0')}",
        "precioTotal": precioTotal,
        "precioLimpieza": precioLimpieza,
        "precioNoches": precioNoches,
        "precioServicio": precioServicio,
      };
}
