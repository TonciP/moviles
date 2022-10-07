import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:peliculas/models/pelicula.dart';
import 'package:peliculas/models/result.dart';

class ListaPeliculas2 extends StatefulWidget {
  final Map<String, dynamic>? args;
  const ListaPeliculas2(this.args, {Key? key}) : super(key: key);
  @override
  _ListaPeliculasState createState() => _ListaPeliculasState();
}

class _ListaPeliculasState extends State<ListaPeliculas2> {
  @override
  Widget build(BuildContext context) {
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
    ));
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

Future<List<Result>> fechListaPosts() async {
  var urlPase =
      'https://api.themoviedb.org/4/search/movie?api_key=3bc1fc06fa7c6b6ecefcc4da6a757160&query=c';
  var url = Uri.parse(urlPase);
  http.Response res = await http.get(url);
  if (res.statusCode == 200) {
    Pelicula pe = res.body as Pelicula;
    return pe.results;
  } else {
    throw Exception('Failed to load post');
  }
}
