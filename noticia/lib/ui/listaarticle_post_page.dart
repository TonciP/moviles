import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:noticia/models/article.dart';
import 'package:noticia/models/noticia.dart';

class ListaArticlePostsPage extends StatefulWidget {
  const ListaArticlePostsPage({Key? key}) : super(key: key);

  @override
  State<ListaArticlePostsPage> createState() => _ListaArticlePostsPageState();
}

class _ListaArticlePostsPageState extends State<ListaArticlePostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Noticias"),
      ),
      body: FutureBuilder(
          future: fechListaPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else {
                List<Article> datos = snapshot.data as List<Article>;
                return ListView.builder(
                  itemCount: datos.length,
                  itemBuilder: (context, index) => Card(
                      margin: const EdgeInsets.all(50),
                      child: Column(
                        children: [
                          Image.network(datos[index].urlToImage,
                              errorBuilder: (context, error, stackTrace) {
                            return Image.asset("assets/jake.webp");
                          }),
                          ListTile(
                            leading: const Icon(Icons.album),
                            title: const Text('Noticia'),
                            subtitle: Text(datos[index].title),
                            onTap: () {
                              Navigator.pushNamed(context, '/detallearticle',
                                  arguments: {'q': datos[index].title});
                            },
                          ),
                        ],
                      )),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Future<List<Article>> fechListaPosts() async {
    var url = Uri.http('newsapi.org', '/v2/everything', {
      "q": "tesla",
      "from": "2022-06-09",
      "sortBy": "publishedAt",
      "apiKey": "4db01af6988e4a8ea8c4ea805e49ea86"
    });
    http.Response res = await http.get(url);
    if (res.statusCode == 200) {
      Noticia noticia = notiaFromJson(res.body);
      return noticia.articles;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
