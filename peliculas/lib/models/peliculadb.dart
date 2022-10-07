// To parse this JSON data, do
//
//     final peliculadb = peliculadbFromJson(jsonString);

import 'dart:convert';

Peliculadb peliculadbFromJson(String str) =>
    Peliculadb.fromJson(json.decode(str));

String peliculadbToJson(Peliculadb data) => json.encode(data.toJson());

class Peliculadb {
  dynamic id;
  String titulo;
  String ano;
  String duracion;
  String genero;
  String director;
  String sinopsis;
  String imagen;
  String rating;

  Peliculadb({
    this.id,
    required this.titulo,
    required this.ano,
    required this.duracion,
    required this.genero,
    required this.director,
    required this.sinopsis,
    required this.imagen,
    required this.rating,
  });

  factory Peliculadb.fromJson(Map<String, dynamic> json) => Peliculadb(
        id: json["id"],
        titulo: json["titulo"],
        ano: json["ano"],
        duracion: json["duracion"],
        genero: json["genero"],
        director: json["director"],
        sinopsis: json["sinopsis"],
        imagen: json["imagen"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "ano": ano,
        "duracion": duracion,
        "genero": genero,
        "director": director,
        "sinopsis": sinopsis,
        "imagen": imagen,
        "rating": rating,
      };

  Map<String, dynamic> toMap() => {
        "titulo": titulo,
        "ano": ano,
        "duracion": duracion,
        "genero": genero,
        "director": director,
        "sinopsis": sinopsis,
        "imagen": imagen,
        "rating": rating,
      };
}
