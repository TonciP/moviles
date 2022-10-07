import 'package:airbnb/model/buscarCiudad.dart';
import 'package:airbnb/model/responseReserva/getReservas.dart';
import 'package:airbnb/model/responseSearch/responseSearch.dart';
import 'package:http/http.dart' as http;

class HomeService {
  HomeService();

  static Future<ReponseSearch> postBuscarCiudad(
      BuscarCiudad buscarCiudad) async {
    var url = Uri.http('bnb.jmacboy.com', '/api/lugares/search', {});
    http.Response res = await http.post(url, body: {
      "ciudad": buscarCiudad.ciudad.toString(),
      "fechaInicio": buscarCiudad.fechaInicio.toString(),
      "fechaFin": buscarCiudad.fechaFin.toString(),
      "cantPersonas": buscarCiudad.cantPersonas.toString(),
    });
    if (res.statusCode == 200) {
      ReponseSearch login = responseSearchFromJson(res.body);
      return login;
    } else {
      throw Exception('Failed to load post');
    }
  }

  static Future<GetReservas> getReservas(usuarioId) async {
    var url = Uri.http(
        'bnb.jmacboy.com', '/api/reservas/cliente/' + usuarioId.toString(), {});
    http.Response res = await http.get(url);
    if (res.statusCode == 200) {
      GetReservas reservas = getReservasFromJson(res.body);
      return reservas;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
