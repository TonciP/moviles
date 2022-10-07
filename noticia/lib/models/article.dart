import 'dart:convert';

import 'package:noticia/models/source.dart';

Article articleoneFromJson(String str) => Article.fromJson(json.decode(str));

String articleToJson(Article data) => json.encode(data.toJson());

Article oneFromJson(String str) => Article.fromJson(json.decode(str));

List<Article> articleFromJson(String str) =>
    List<Article>.from(json.decode(str).map((x) => Article.fromJson(x)));

class Article {
  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"] ?? ""),
        author: json["author"] ?? "",
        title: json["title"] ?? "",
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"] == null
            ? "https://www.welivesecurity.com/wp-content/uploads/2021/09/resumen-noticias-ciberseguridad-agosto.jpg"
            : json['urlToImage'],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}
