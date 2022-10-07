class SpokenLanguage {
  SpokenLanguage({
    required this.iso6391,
    required this.name,
  });

  String iso6391;
  String name;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
        iso6391: json["iso_639_1"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "iso_639_1": iso6391,
        "name": name,
      };
}
