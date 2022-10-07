// To parse this JSON data, do
//
//     final pelicula = peliculaFromJson(jsonString);

import 'dart:convert';

import 'package:peliculas/models/result.dart';

Pelicula peliculaFromJson(String str) => Pelicula.fromJson(json.decode(str));

String peliculaToJson(Pelicula data) => json.encode(data.toJson());

class Pelicula {
  Pelicula({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  factory Pelicula.fromJson(Map<String, dynamic> json) => Pelicula(
        page: json["page"] ?? 0,
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}
