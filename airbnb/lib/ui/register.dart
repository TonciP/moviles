import 'dart:developer';

import 'package:airbnb/model/reponse/responseLogin.dart';
import 'package:airbnb/model/usuario.dart';
import 'package:airbnb/service/loginservice.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String telefono = '';
  String nombrecompleto = '';

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
                    'https://brandemia.org/sites/default/files/sites/default/files/bnb_billboard_01-2000x1125.jpg'),
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
              child: SingleChildScrollView(
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
                        errorStyle:
                            TextStyle(color: Colors.black, fontSize: 15),
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
                        errorStyle:
                            TextStyle(color: Colors.black, fontSize: 15),
                        //labelText: 'Password',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                      onSaved: (String? value) {
                        debugPrint('Value for field saved as "$value"');
                        log(value.toString());
                        telefono = value.toString();
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter your telefono',
                        hintStyle: TextStyle(color: Colors.white),
                        errorStyle:
                            TextStyle(color: Colors.black, fontSize: 15),
                        //labelText: 'Password',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                      onSaved: (String? value) {
                        debugPrint('Value for field saved as "$value"');
                        log(value.toString());
                        nombrecompleto = value.toString();
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter your nombre completo',
                        hintStyle: TextStyle(color: Colors.white),
                        errorStyle:
                            TextStyle(color: Colors.black, fontSize: 15),
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
                            log('correcto' + _formKey.toString());
                            var login = LoginService.registro(Usuario(
                                email: email,
                                password: password,
                                telefono: telefono,
                                nombrecompleto: nombrecompleto));
                            login.then((value) => {
                                  if (value.res == 'success')
                                    {
                                      Navigator.pushReplacementNamed(
                                          context, '/')
                                      //await _storage.write(key: 'token', value: value.data.token);
                                    }
                                  else
                                    {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  'No se pudo Registrar'),
                                              content: Text(value.res),
                                              actions: <Widget>[
                                                FlatButton(
                                                  child: const Text('Ok'),
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
                        child: const Text('Registrate'),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("¿Si tienes una cuenta? "),
                        GestureDetector(
                          child: const Text(
                            "Inicia sesión",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () async {
                            Navigator.pushNamed(context, '/');
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            )));
  }
}
