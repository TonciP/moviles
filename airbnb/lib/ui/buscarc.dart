import 'dart:developer';

import 'package:airbnb/model/buscarCiudad.dart';
import 'package:airbnb/model/reponse/responseLogin.dart';
import 'package:airbnb/service/homeservice.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:intl/intl.dart';
import 'package:textfield_search/textfield_search.dart';

class BuscarPage extends StatelessWidget {
  final Map<String, dynamic>? args;
  const BuscarPage(this.args, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController dateinputSalida = TextEditingController();
    TextEditingController dateinputEntrada = TextEditingController();
    TextEditingController inputCiudad = TextEditingController();
    TextEditingController inputCantHuesped = TextEditingController();

    Data usuario = args?.containsKey('usuario') ?? false ? args!['usuario'] : 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        actions: [
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: MySearchDelegate());
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                children: [
                  TextField(
                    controller: inputCiudad,
                    decoration: const InputDecoration(
                      hintText: 'Ingrese la Ciudad',
                      icon: Icon(Icons.search),
                    ),
                  ),
                  TextField(
                    controller: dateinputEntrada,
                    decoration: const InputDecoration(
                      hintText: 'Fecha de Llegada',
                      icon: Icon(Icons.calendar_today),
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2025));
                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        dateinputEntrada..text = formattedDate;
                      } else {
                        print("Date is not selected");
                      }
                    },
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Fecha de Salida',
                      icon: Icon(Icons.calendar_today),
                    ),
                    controller: dateinputSalida,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2025));
                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        dateinputSalida..text = formattedDate;
                      } else {
                        print("Date is not selected");
                      }
                    },
                  ),
                  TextField(
                    controller: inputCantHuesped,
                    decoration: const InputDecoration(
                      hintText: 'Cantidad de Huesped',
                      icon: Icon(Icons.person_pin_circle),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            ElevatedButton(
                                child: const Text('Buscar'),
                                onPressed: () {
                                  log("Buscar");
                                  BuscarCiudad buscarCiudad = BuscarCiudad(
                                      ciudad: inputCiudad.text,
                                      fechaInicio:
                                          dateinputEntrada.text.isNotEmpty
                                              ? DateTime.parse(
                                                  dateinputEntrada.text)
                                              : DateTime.now(),
                                      fechaFin: dateinputSalida.text.isNotEmpty
                                          ? DateTime.parse(dateinputSalida.text)
                                          : DateTime.now(),
                                      cantPersonas:
                                          inputCantHuesped.text.isNotEmpty
                                              ? int.parse(inputCantHuesped.text)
                                              : 0);
                                  Navigator.pushNamed(context, '/lugares',
                                      arguments: {
                                        'filtro': buscarCiudad,
                                        'usuario': usuario
                                      });
                                }),
                            ElevatedButton(
                                child: const Text('Busqueda Avanzada'),
                                onPressed: () {
                                  log("Buscar");
                                  Navigator.pushNamed(context, '/map');
                                }),
                            ElevatedButton(
                                child: const Text('Ver reservas'),
                                onPressed: () {
                                  log("Buscar");
                                  /* Navigator.pushNamed(context, '/reservas',
                                      arguments: {'id': usuario.id}); */
                                  Navigator.pushNamed(context, '/reservas',
                                      arguments: {'idusuario': usuario.id});
                                })
                          ],
                        ),
                      )),
                ],
              ),
            )),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate<String> {
  List<String> searchResults = <String>[
    'Avengersss',
    'Avengers: Endgame',
    'Captain Marvel',
    'Black Panther',
    'Avengers: Infinity War',
    'Avengers: Age of Ultron',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          if (query.isNotEmpty) {
            query = '';
          } else {
            close(context, "");
          }
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) => Container();

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<String> suggestions = searchResults.where((searchResults) {
      searchResults.toLowerCase().contains(query.toLowerCase());
      final result = searchResults.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];

            showResults(context);
          },
        );
      },
    );
  }
}
