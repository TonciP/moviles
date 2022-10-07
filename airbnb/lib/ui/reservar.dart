import 'package:airbnb/model/postReserva/postReserva.dart';
import 'package:airbnb/model/reponse/responseLogin.dart' as Dato;
import 'package:airbnb/model/responseLugares/lugaresById.dart';
import 'package:airbnb/service/reservaservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReservarPage extends StatefulWidget {
  final Map<String, dynamic>? args;
  const ReservarPage(this.args, {Key? key}) : super(key: key);
  @override
  State<ReservarPage> createState() => _ReservarPage();
}

class _ReservarPage extends State<ReservarPage> {
  late TextEditingController _controller;
  String noche = "1";
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.text =
        widget.args?.containsKey('noche') ?? false ? widget.args!['noche'] : "";
    _controller.addListener(() {
      setState(() {
        noche = _controller.text;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GetLugaresById lugar = widget.args?.containsKey('objreserva') ?? false
        ? widget.args!['objreserva']
        : 0;
    Dato.Data usuario = widget.args?.containsKey('usuario') ?? false
        ? widget.args!['usuario']
        : 0;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reservas'),
        ),
        body: SingleChildScrollView(
          child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  children: [
                    TextField(
                        controller: _controller,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Ingrese la Cantida de Noches',
                          icon: Icon(Icons.nightlight_round),
                        )),
                    Row(children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 50, 50, 0),
                          child: Text(
                            '${lugar.data.precioNoche} \$ / Noche',
                          )),
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                          child: Text(
                            '${noche != "" ? (int.parse(noche) * double.parse(lugar.data.precioNoche)) : ""} \$',
                          )),
                    ]),
                    Row(children: [
                      const Padding(
                          padding: EdgeInsets.fromLTRB(0, 50, 50, 0),
                          child: Text('Gastos de Limpieza')),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                          child: Text(
                            '${lugar.data.costoLimpieza} \$',
                          ))
                    ]),
                    Row(children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 50, 100, 0),
                          child: Text("Total")),
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                          child: Text(
                              '${noche != "" ? ((int.parse(noche) * double.parse(lugar.data.precioNoche)) + double.parse(lugar.data.costoLimpieza)) : ""} \$')),
                    ]),
                    ElevatedButton(
                        child: const Text('Confirmar Reserva'),
                        onPressed: () {
                          ReservaService.postReserva(PostReserva(
                                  lugarId: lugar.data.id.toString(),
                                  clienteId: usuario.id,
                                  fechaInicio: DateTime.now(),
                                  fechaFin: DateTime.now(),
                                  precioTotal:
                                      '${noche != "" ? ((int.parse(noche) * double.parse(lugar.data.precioNoche)) + double.parse(lugar.data.costoLimpieza)) : 0.0} ',
                                  precioLimpieza: lugar.data.costoLimpieza,
                                  precioNoches: lugar.data.precioNoche,
                                  precioServicio: '20.0'))
                              .then((value) => {
                                    if (value.res == 'success')
                                      {
                                        Navigator.pushNamed(context, '/buscar',
                                            arguments: {'usuario': usuario})
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
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                            })
                                      }
                                  });
                        })
                  ],
                ),
              )),
        ));
  }
}
