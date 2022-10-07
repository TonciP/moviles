import 'dart:developer';

import 'package:airbnb/model/login.dart';
import 'package:airbnb/model/reponse/responseLogin.dart';
import 'package:airbnb/service/loginservice.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /* appBar: AppBar(
          title: const Text('Inicia Sesión'),
        ), */
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://tentulogo.com/wp-content/uploads/airbnb-logo-1.png'),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(30),
            child: Form(
              onChanged: () {
                Form.of(primaryFocus!.context!)!.save();
              },
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    onSaved: (String? value) {
                      debugPrint('Value for field saved as "$value"');
                      log(value.toString());
                      email = value.toString();
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(color: Colors.white),
                      errorStyle: TextStyle(color: Colors.black, fontSize: 15),
                      //labelText: 'Email',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    onSaved: (String? value) {
                      debugPrint('Value for field saved as "$value"');
                      log(value.toString());
                      password = value.toString();
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter your passwod',
                      hintStyle: TextStyle(color: Colors.white),
                      errorStyle: TextStyle(color: Colors.black, fontSize: 15),
                      //labelText: 'Password',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                        if (_formKey.currentState!.validate()) {
                          // Process data.
                          //log('correcto' + _formKey.toString());

                          var login = LoginService.login(
                              Login(email: email, password: password));
                          login.then((value) async => {
                                if (value.res == 'success')
                                  {
                                    log('Se ingreso correctamente'),
                                    /* await Navigator.pushReplacementNamed(
                                        context, '/home') */
                                    Navigator.pushNamed(context, '/buscar',
                                        arguments: {'usuario': value.data})
                                  }
                                else
                                  {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Error'),
                                            content: Text(value.res),
                                            actions: <Widget>[
                                              FlatButton(
                                                child: Text('Ok'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        })
                                  }
                              });
                        }
                      },
                      child: const Text('Iniciar Session'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("¿No tienes cuenta? "),
                      GestureDetector(
                        child: const Text(
                          "Registrate",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () async {
                          Navigator.pushNamed(context, '/registro');
                        },
                      )
                    ],
                  )
                ],
              ),
            )));
  }
}
