import 'dart:developer';

import 'package:airbnb/model/buscarCiudad.dart';
import 'package:airbnb/model/reponse/responseLogin.dart';
import 'package:airbnb/model/responseReserva/getReservas.dart';
import 'package:airbnb/model/responseSearch/responseSearch.dart';
import 'package:airbnb/service/homeservice.dart';
import 'package:airbnb/ui/vistaMapa.dart';
import 'package:flutter/material.dart';

class ListaLugaresPage extends StatelessWidget {
  final Map<String, dynamic>? args;

  const ListaLugaresPage(this.args, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    BuscarCiudad filtro =
        args?.containsKey('filtro') ?? false ? args!['filtro'] : 0;
    Data usuario = args?.containsKey('usuario') ?? false ? args!['usuario'] : 0;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.pushNamed(context, '/map');
          HomeService.postBuscarCiudad(filtro).then((value) {
            if (value.res == 'success') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => Home(
                            lugares: value.data,
                          ))) /*  MaterialPageRoute(builder: ((context) => Home())) */);
            } else {
              print('Error');
            }
          });
        },
        child: Icon(Icons.map),
      ),
      appBar: AppBar(
        title: const Text('Lugares'),
      ),
      body: FutureBuilder(
        future: HomeService.postBuscarCiudad(filtro),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ReponseSearch lugares = snapshot.data as ReponseSearch;
            return ListView.builder(
              itemCount: lugares.data.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/detalleLugar',
                        arguments: {
                          'idlugar': lugares.data[index].id.toString(),
                          'usuario': usuario,
                        },
                      );
                    },
                    child: SingleChildScrollView(
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    // ignore: unnecessary_string_interpolations
                                    "${lugares.data[index].fotos.isEmpty ? "" : lugares.data[index].fotos[0].url}",
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        "assets/jake.webp",
                                        width: 50,
                                        height: 50,
                                      );
                                    },
                                    width: 50,
                                    height: 50,
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 150,
                                            child: Text(
                                              lugares.data[index].nombre,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 150,
                                            child: Text(
                                              lugares.data[index].descripcion,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 100,
                                            child: Text(
                                                '${lugares.data[index].cantPersonas.toString()} Personas'),
                                          ),
                                        ],
                                      )),
                                  Text(
                                      '${lugares.data[index].precioNoche.toString()} \$'),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ));
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
}
