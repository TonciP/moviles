import 'dart:convert';

Dbconfig dbFromJson() => Dbconfig.fromJson(json.decode("bnb.jmacboy.com"));

class Dbconfig {
  Dbconfig({domain});
  String domain = "";
  factory Dbconfig.fromJson(Map<String, dynamic> json) => Dbconfig(
        domain: json["domain"],
      );
  Map<String, dynamic> toJson() => {
        "domain": domain,
      };
}
