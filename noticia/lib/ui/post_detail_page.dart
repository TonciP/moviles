import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:noticia/models/article.dart';
import 'package:noticia/models/noticia.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:url_launcher/url_launcher.dart';

class PostArticleDetailPage extends StatelessWidget {
  final Map<String, dynamic>? args;
  const PostArticleDetailPage(this.args, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String q = args?.containsKey('q') ?? false ? args!['q'] : 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detaller Noticia"),
      ),
      body: FutureBuilder(
          future: fetchPost(q),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Article objarticle = snapshot.data as Article;
              return Container(
                padding: const EdgeInsets.all(50),
                child: Column(children: [
                  Image.network(
                    objarticle.urlToImage,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset("assets/jake.webp");
                    },
                  ),
                  Card(
                      child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.album),
                        title: const Text('Noticia'),
                        subtitle: Text(objarticle.title),
                        onTap: () {
                          _launchInBrowser(Uri.parse(objarticle.url));
                        },
                      ),
                      Text(objarticle.description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontStyle: FontStyle.italic))
                    ],
                  )),
                ]),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<Article> fetchPost(String q) async {
    var url = Uri.http('newsapi.org', '/v2/everything',
        {"q": q, "apiKey": "4db01af6988e4a8ea8c4ea805e49ea86"});
    http.Response res = await http.get(url);
    if (res.statusCode == 200) {
      Noticia noticia = notiaFromJson(res.body);
      return noticia.articles[0];
    } else {
      throw Exception('Failed to load post');
    }
  }
}
