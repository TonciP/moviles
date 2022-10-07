import 'package:airbnb/model/reponse/responseLogin.dart' as Dato;
import 'package:airbnb/model/responseLugares/lugaresById.dart';
import 'package:airbnb/service/lugarservice.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetalleLugar extends StatelessWidget {
  final Map<String, dynamic>? args;
  const DetalleLugar(this.args, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String idlugar =
        args?.containsKey('idlugar') ?? false ? args!['idlugar'] : 0;
    Dato.Data usuario =
        args?.containsKey('usuario') ?? false ? args!['usuario'] : 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservas'),
      ),
      body: FutureBuilder(
          future: LugaresService.getLugarById(idlugar),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              GetLugaresById lugar = snapshot.data as GetLugaresById;
              return SingleChildScrollView(
                  child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Column(children: [
                      CarouselSlider.builder(
                        itemCount: lugar.data.fotos.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            Container(
                          child: Image.network(
                            // ignore: unnecessary_string_interpolations
                            "${lugar.data.fotos.isEmpty ? "" : lugar.data.fotos[itemIndex].url}",
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "assets/jake.webp",
                                width: 800,
                                height: 70,
                              );
                            },
                            width: 800,
                            height: 70,
                            scale: 1.0,
                          ),
                        ),
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 2.0,
                          enlargeCenterPage: true,
                          viewportFraction: 0.9,
                          initialPage: 0,
                        ),
                      ),
                      Text('${lugar.data.precioNoche} \$ / Noche'),
                      Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    lugar.data.nombre,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    lugar.data.descripcion,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Personas: ${lugar.data.cantPersonas.toString()} ",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    "Camas: ${lugar.data.cantCamas.toString()} ",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    "Banios: ${lugar.data.cantBanios.toString()} ",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "${lugar.data.cantHabitaciones.toString()} Habitacion",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "${lugar.data.tieneWifi.toString() == 1 ? "Tiene Wifi" : "No tiene Wifi"}",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Parqueo para ${lugar.data.cantVehiculosParqueo.toString()} Vehiculo",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ]),
                  ),
                  ElevatedButton(
                      child: const Text('Reservar'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/reservarpage',
                            arguments: {
                              'objreserva': lugar,
                              'usuario': usuario,
                            });
                      }),
                ],
              ));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
