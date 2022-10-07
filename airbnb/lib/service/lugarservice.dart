import 'package:airbnb/model/buscarCiudad.dart';
import 'package:airbnb/model/responseLugares/lugaresById.dart';
import 'package:airbnb/model/responseReserva/getReservas.dart';
import 'package:airbnb/model/responseSearch/responseSearch.dart';
import 'package:http/http.dart' as http;

class LugaresService {
  LugaresService();

  static Future<ReponseSearch> getLugares(BuscarCiudad buscarCiudad) async {
    var url = Uri.http('bnb.jmacboy.com', '/api/lugares/search', {});
    http.Response res = await http.get(url);
    if (res.statusCode == 200) {
      ReponseSearch login = responseSearchFromJson(res.body);
      return login;
    } else {
      throw Exception('Failed to load post');
    }
  }

  static Future<GetLugaresById> getLugarById(idlugar) async {
    var url =
        Uri.http('bnb.jmacboy.com', '/api/lugares/' + idlugar.toString(), {});
    http.Response res = await http.get(url);
    if (res.statusCode == 200) {
      GetLugaresById lugar = getLugaresByIdFromJson(res.body);
      return lugar;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
