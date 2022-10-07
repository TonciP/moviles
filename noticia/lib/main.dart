import 'package:flutter/material.dart';
import 'package:noticia/ui/listaarticle_post_page.dart';
import 'package:noticia/ui/post_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const ListaArticlePostsPage(),
        '/detallearticle': (context) => PostArticleDetailPage(
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>)
      },
      initialRoute: '/',
    );
  }
}
