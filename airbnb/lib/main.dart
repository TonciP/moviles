import 'package:airbnb/ui/buscarc.dart';
import 'package:airbnb/ui/detalleLugar.dart';
import 'package:airbnb/ui/listaLugares.dart';
import 'package:airbnb/ui/login.dart';
import 'package:airbnb/ui/register.dart';
import 'package:airbnb/ui/reservar.dart';
import 'package:airbnb/ui/reservas.dart';

import 'package:flutter/material.dart';

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
        '/': (context) => const LoginPage(title: 'Pagina Principal'),
        '/registro': (context) => const RegisterPage(title: 'Registrarse'),
        '/buscar': (context) => BuscarPage(
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>),
        '/reservas': (context) => ReservasPage(
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>),
        '/lugares': (context) => ListaLugaresPage(
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>),
        /* '/map': (context) => MapSample(
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>,), */
        '/detalleLugar': (context) => DetalleLugar(
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>),
        '/reservarpage': (context) => ReservarPage(
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>),
      },
      initialRoute: '/',
    );
  }
}
