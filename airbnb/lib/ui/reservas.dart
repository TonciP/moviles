import 'package:airbnb/model/reponse/responseLogin.dart';
import 'package:airbnb/model/responseLugares/lugaresById.dart';
import 'package:airbnb/model/responseReserva/getReservas.dart';
import 'package:airbnb/service/homeservice.dart';
import 'package:airbnb/service/reservaservice.dart';
import 'package:flutter/material.dart';

class ReservasPage extends StatelessWidget {
  final Map<String, dynamic>? args;

  const ReservasPage(this.args, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int idusuario =
        args?.containsKey('idusuario') ?? false ? args!['idusuario'] : 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservas'),
      ),
      body: FutureBuilder(
        future: HomeService.getReservas(idusuario),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            GetReservas reservas = snapshot.data as GetReservas;
            return ListView.builder(
              itemCount: reservas.data.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FutureBuilder(
                            future: ReservaService.getLugaresById(
                                reservas.data[index].lugarId),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                GetLugaresById lugar =
                                    snapshot.data as GetLugaresById;
                                return Row(
                                  children: [
                                    Image.network(
                                      // ignore: unnecessary_string_interpolations
                                      "${lugar.data.fotos[0].url}",
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset("assets/jake.webp");
                                      },
                                      width: 70,
                                      height: 70,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(lugar.data.ciudad),
                                            Text(
                                                '${lugar.data.precioNoche} \$'),
                                          ],
                                        ),
                                        Text(getCantidaNoches(
                                                reservas
                                                    .data[index].fechaInicio,
                                                reservas.data[index].fechaFin)
                                            .toString()),
                                        Text(
                                            "Desde ${getFechaFormat(reservas.data[index].fechaInicio)}"),
                                        Text(
                                            "Hasta ${getFechaFormat(reservas.data[index].fechaFin)}"),
                                        Text(reservas.data[index].lugar
                                            .arrendatario.nombrecompleto),
                                      ],
                                    )
                                  ],
                                );
                              } else {
                                return Text(
                                  'Cargando...',
                                  style: TextStyle(fontSize: 20),
                                );
                              }
                            }),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  getCantidaNoches(DateTime fechaInicio, DateTime fechaFin) {
    int noches = 0;
    noches = fechaFin.difference(fechaInicio).inDays;

    return noches;
  }

  getFechaFormat(DateTime fecha) {
    String fechaFormat = '';
    fechaFormat = '${fecha.day}/${fecha.month}/${fecha.year}';
    return fechaFormat;
  }
}
