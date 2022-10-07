import 'package:airbnb/configdb/dbconfig.dart';
import 'package:airbnb/model/login.dart';
import 'package:airbnb/model/reponse/responseLogin.dart';
import 'package:airbnb/model/usuario.dart';
import 'package:http/http.dart' as http;

class LoginService {
  LoginService();

  static Future<ReponseLogin> login(Login login) async {
    var url = Uri.http('bnb.jmacboy.com', '/api/cliente/login', {});
    http.Response res = await http.post(url, body: {
      "email": login.email,
      "password": login.password,
    });
    if (res.statusCode == 200) {
      ReponseLogin login = reponseLoginFromJson(res.body);
      return login;
    } else {
      throw Exception('Failed to load post');
    }
  }

  static Future<ReponseLogin> registro(Usuario registro) async {
    var url = Uri.http('bnb.jmacboy.com', '/api/cliente/registro', {});
    http.Response res = await http.post(url, body: {
      "email": registro.email,
      "password": registro.password,
      "nombrecompleto": registro.nombrecompleto,
      "telefono": registro.telefono,
    });
    if (res.statusCode == 200) {
      ReponseLogin login = reponseLoginFromJson(res.body);
      return login;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
