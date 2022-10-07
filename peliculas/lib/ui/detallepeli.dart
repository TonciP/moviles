import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/Conn/db.dart';
import 'package:peliculas/models/peliculadb.dart';

class PostPeliDetailPage extends StatelessWidget {
  final Map<String, dynamic>? args;
  const PostPeliDetailPage(this.args, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Peliculadb pelicula = args?.containsKey('q') ?? false ? args!['q'] : 0;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Detaller Noticia"),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
            "https://image.tmdb.org/t/p/w500/${pelicula.imagen}",
          ))),
          padding: const EdgeInsets.all(50),
          child: Column(children: [
            Text(pelicula.titulo,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white)),
            Text(pelicula.ano,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white)),
            Text(pelicula.duracion,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white)),
            Text(pelicula.genero,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white)),
            Text(pelicula.director,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white)),
            Text(pelicula.sinopsis,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white)),
            /* Image.network(
              "https://image.tmdb.org/t/p/w500/${pelicula.imagen}",
              errorBuilder: (context, error, stackTrace) {
                return Image.asset("assets/jake.webp");
              },
              width: 400,
              height: 200,
            ), */
            Text(pelicula.rating,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white))
          ]),
        ));
  }
}
