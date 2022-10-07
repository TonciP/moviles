// To parse this JSON data, do
//
//     final detalle = detalleFromJson(jsonString);

import 'dart:convert';

import 'package:peliculas/models/genero.dart';
import 'package:peliculas/models/production_company.dart';
import 'package:peliculas/models/production_country.dart';
import 'package:peliculas/models/spokenlanguage.dart';

Detalle detalleFromJson(String str) => Detalle.fromJson(json.decode(str));

String detalleToJson(Detalle data) => json.encode(data.toJson());

class Detalle {
  Detalle({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  bool adult;
  String backdropPath;
  dynamic belongsToCollection;
  int budget;
  List<Genre> genres;
  String homepage;
  int id;
  String imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  dynamic posterPath;
  List<ProductionCompany> productionCompanies;
  List<ProductionCountry> productionCountries;
  String releaseDate;
  int revenue;
  int runtime;
  List<SpokenLanguage> spokenLanguages;
  String status;
  String tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  factory Detalle.fromJson(Map<String, dynamic> json) => Detalle(
        adult: json["adult"] ?? false,
        backdropPath: json["backdrop_path"] ?? "",
        belongsToCollection: json["belongs_to_collection"] ?? "",
        budget: json["budget"] ?? 0,
        genres: json["genres"] != null
            ? List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x)))
            : [],
        homepage: json["homepage"] ?? "",
        id: json["id"] ?? 0,
        imdbId: json["imdb_id"] ?? "",
        originalLanguage: json["original_language"] ?? "",
        originalTitle: json["original_title"] ?? "",
        overview: json["overview"] ?? "",
        popularity: json["popularity"] ?? 0.0,
        posterPath: json["poster_path"] ?? "",
        productionCompanies: json["production_companies"] != null
            ? List<ProductionCompany>.from(json["production_companies"]
                .map((x) => ProductionCompany.fromJson(x)))
            : [],
        productionCountries: json["production_countries"] != null
            ? List<ProductionCountry>.from(json["production_countries"]
                .map((x) => ProductionCountry.fromJson(x)))
            : [],
        releaseDate: json["release_date"] ?? "2020-01-01",
        revenue: json["revenue"] ?? 0,
        runtime: json["runtime"] ?? 0,
        spokenLanguages: json["spoken_languages"] != null
            ? List<SpokenLanguage>.from(
                json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x)))
            : [],
        status: json["status"] ?? "",
        tagline: json["tagline"] ?? "",
        title: json["title"] ?? "",
        video: json["video"] ?? false,
        voteAverage: json["vote_average"] ?? 0.0,
        voteCount: json["vote_count"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "belongs_to_collection": belongsToCollection,
        "budget": budget,
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies":
            List<dynamic>.from(productionCompanies.map((x) => x.toJson())),
        "production_countries":
            List<dynamic>.from(productionCountries.map((x) => x.toJson())),
        "release_date": releaseDate,
        "revenue": revenue,
        "runtime": runtime,
        "spoken_languages":
            List<dynamic>.from(spokenLanguages.map((x) => x.toJson())),
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
