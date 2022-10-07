import 'dart:convert';

import 'package:noticia/models/article.dart';

Noticia notiaFromJson(String str) => Noticia.fromJson(json.decode(str));

String notiaToJson(Noticia data) => json.encode(data.toJson());

class Noticia {
  Noticia({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  String status;
  int totalResults;
  List<Article> articles;

  factory Noticia.fromJson(Map<String, dynamic> json) => Noticia(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}
