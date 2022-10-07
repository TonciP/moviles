import 'package:flutter/material.dart';
import 'package:peliculas/ui/detallepeli.dart';
import 'package:peliculas/ui/lista_peliculas.dart';

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
        '/': (context) => const ListaPeliculas(),
        '/detallepeli': (context) => PostPeliDetailPage(
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>),
      },
      initialRoute: '/',
    );
  }
}
