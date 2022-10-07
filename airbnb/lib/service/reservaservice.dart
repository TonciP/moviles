import 'package:airbnb/model/buscarCiudad.dart';
import 'package:airbnb/model/postReserva/postReserva.dart';
import 'package:airbnb/model/responseLugares/lugaresById.dart';
import 'package:airbnb/model/responseReserva/getReservaAvance.dart';
import 'package:airbnb/model/responseReserva/getReservas.dart';
import 'package:airbnb/model/responseSearch/responseSearch.dart';
import 'package:http/http.dart' as http;

class ReservaService {
  ReservaService();

  static Future<GetLugaresById> getLugaresById(lugarId) async {
    // ignore: unnecessary_brace_in_string_interps
    var url =
        Uri.http('bnb.jmacboy.com', '/api/lugares/${lugarId.toString()}', {});
    http.Response res = await http.get(url);
    if (res.statusCode == 200) {
      GetLugaresById lugar = getLugaresByIdFromJson(res.body);
      return lugar;
    } else {
      throw Exception('Failed to load post');
    }
  }

  static Future<GetReservaAvance> postReserva(PostReserva reserva) async {
    // ignore: unnecessary_brace_in_string_interps
    var url = Uri.http('bnb.jmacboy.com', '/api/reservas', {});
    http.Response res = await http.post(url, body: {
      "lugar_id": reserva.lugarId.toString(),
      "cliente_id": reserva.clienteId.toString(),
      "fechaInicio": reserva.fechaInicio.toString(),
      "fechaFin": reserva.fechaFin.toString(),
      "precioTotal": reserva.precioTotal.toString(),
      "precioLimpieza": reserva.precioLimpieza.toString(),
      "precioNoches": reserva.precioNoches.toString(),
      "precioServicio": reserva.precioServicio.toString(),
    });
    if (res.statusCode == 200) {
      GetReservaAvance reserva = getReservaAvanceFromJson(res.body);
      return reserva;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
