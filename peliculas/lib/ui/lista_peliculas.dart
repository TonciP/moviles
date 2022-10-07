import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:peliculas/Conn/db.dart';
import 'package:peliculas/models/creditos.dart';
import 'package:peliculas/models/genero.dart';
import 'package:peliculas/models/pelicula.dart';
import 'package:peliculas/models/peliculadb.dart';
import 'package:peliculas/models/result.dart';

import '../models/detalle.dart';

class ListaPeliculas extends StatefulWidget {
  const ListaPeliculas({Key? key}) : super(key: key);
  @override
  _ListaPeliculasState createState() => _ListaPeliculasState();
}

class _ListaPeliculasState extends State<ListaPeliculas> {
  List<Peliculadb> peliculasdb = [];
  @override
  void initState() {
    cargarPeliculas();
    super.initState();
  }

  cargarPeliculas() async {
    List<Peliculadb> auxPeli = await DB.peliculas();
    setState(() {
      peliculasdb = auxPeli;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        actions: [
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: MySearchDelegate())
                    .then((value) {
                  setState(() {
                    cargarPeliculas();
                  });
                });
              })
        ],
      ),
      body: ListView.builder(
        itemCount: peliculasdb.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                  title: Text(peliculasdb[index].titulo),
                  onTap: () {
                    Navigator.pushNamed(context, '/detallepeli',
                        arguments: {'q': peliculasdb[index]});
                  })
            ],
          );
        },
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          if (query.isNotEmpty) {
            query = '';
          } else {
            close(context, "a");
          }
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) => Container();

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: fechObjectDetallerPeliculas(query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Detalle objdetalle = snapshot.data as Detalle;
            List<Genre> genero = objdetalle.genres;
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                "https://image.tmdb.org/t/p/w500/${objdetalle.posterPath}",
              ))),
              padding: const EdgeInsets.all(50),
              child: Column(children: [
                Text(objdetalle.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white)),
                Text(objdetalle.releaseDate.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white)),
                Text(objdetalle.runtime.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white)),
                /* Image.network(
                  "https://image.tmdb.org/t/p/w500/${objdetalle.posterPath}",
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset("assets/jake.webp");
                  },
                  width: 400,
                  height: 200,
                ), */
                Text(genero.isNotEmpty ? genero[0].name : "None",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white)),
                Text(objdetalle.overview,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white)),
                Text(objdetalle.voteCount.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white)),
                FutureBuilder(
                  future: fechObjectCreditoPelicula(query),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Cast crew = snapshot.data as Cast;
                      return ListTile(
                        leading: const Icon(Icons.album),
                        title: const Text('Director',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white)),
                        subtitle: Column(
                          children: [
                            Text(crew.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white)),
                            ElevatedButton(
                                onPressed: () {
                                  DB.insert(Peliculadb(
                                      titulo: objdetalle.title,
                                      ano: objdetalle.releaseDate,
                                      duracion: objdetalle.runtime.toString(),
                                      genero: genero[0].name,
                                      director: crew.name,
                                      sinopsis: objdetalle.overview,
                                      imagen: objdetalle.posterPath,
                                      rating: objdetalle.voteCount.toString()));
                                },
                                child: const Text("Guardar"))
                          ],
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ]),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: fechListaPeliculas(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else {
              List<Result> datos = snapshot.data as List<Result>;
              return ListView.builder(
                itemCount: datos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(datos[index].title),
                    onTap: () {
                      query = datos[index].id.toString();

                      showResults(context);
                    },
                  );
                },
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<List<Result>> fechListaPeliculas(query) async {
    if (query.isEmpty) return [];

    var url = Uri.http('api.themoviedb.org', '/3/search/movie',
        {"api_key": "3bc1fc06fa7c6b6ecefcc4da6a757160", "query": query});
    //http.Response res = await http.get(Uri.parse(urlPase), headers: {
    //  "Content-Type": "application/json",
    //});
    http.Response res = await http.get(url);
    if (res.statusCode == 200) {
      Pelicula pe = peliculaFromJson(res.body);

      return pe.results;
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Detalle> fechObjectDetallerPeliculas(query) async {
    if (query.isEmpty) query = "37686";
    var url = Uri.http('api.themoviedb.org', '/3/movie/${query}',
        {"api_key": "3bc1fc06fa7c6b6ecefcc4da6a757160"});
    //http.Response res = await http.get(Uri.parse(urlPase), headers: {
    //  "Content-Type": "application/json",
    //});
    http.Response res = await http.get(url);
    if (res.statusCode == 200) {
      Detalle detalle = detalleFromJson(res.body);

      return detalle;
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Cast> fechObjectCreditoPelicula(query) async {
    if (query.isEmpty) query = "37686";
    var url = Uri.http('api.themoviedb.org', '/3/movie/${query}/credits',
        {"api_key": "3bc1fc06fa7c6b6ecefcc4da6a757160"});
    //http.Response res = await http.get(Uri.parse(urlPase), headers: {
    //  "Content-Type": "application/json",
    //});
    http.Response res = await http.get(url);
    if (res.statusCode == 200) {
      Creditos creditos = creditosFromJson(res.body);
      var crew = creditos.crew.where((element) => element.job == "Director");
      return crew.first;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
