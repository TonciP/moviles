import 'dart:convert';

GetReservaAvance getReservaAvanceFromJson(String str) =>
    GetReservaAvance.fromJson(json.decode(str));

String getReservaAvanceToJson(GetReservaAvance data) =>
    json.encode(data.toJson());

class GetReservaAvance {
  GetReservaAvance({
    required this.res,
    required this.data,
  });

  String res;
  Data data;

  factory GetReservaAvance.fromJson(Map<String, dynamic> json) =>
      GetReservaAvance(
        res: json["res"],
        data: Data.fromJson(json["data"] ?? ""),
      );

  Map<String, dynamic> toJson() => {
        "res": res,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.lugarId,
    required this.clienteId,
    required this.fechaInicio,
    required this.fechaFin,
    required this.precioTotal,
    required this.precioLimpieza,
    required this.precioNoches,
    required this.precioServicio,
    required this.createdAt,
    required this.updatedAt,
    required this.cliente,
    required this.lugar,
  });

  int id;
  int lugarId;
  int clienteId;
  DateTime fechaInicio;
  DateTime fechaFin;
  String precioTotal;
  String precioLimpieza;
  String precioNoches;
  String precioServicio;
  DateTime createdAt;
  DateTime updatedAt;
  Cliente cliente;
  Lugar lugar;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        lugarId: json["lugar_id"],
        clienteId: json["cliente_id"],
        fechaInicio: DateTime.parse(json["fechaInicio"]),
        fechaFin: DateTime.parse(json["fechaFin"]),
        precioTotal: json["precioTotal"],
        precioLimpieza: json["precioLimpieza"],
        precioNoches: json["precioNoches"],
        precioServicio: json["precioServicio"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        cliente: Cliente.fromJson(json["cliente"]),
        lugar: Lugar.fromJson(json["lugar"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lugar_id": lugarId,
        "cliente_id": clienteId,
        "fechaInicio":
            "${fechaInicio.year.toString().padLeft(4, '0')}-${fechaInicio.month.toString().padLeft(2, '0')}-${fechaInicio.day.toString().padLeft(2, '0')}",
        "fechaFin":
            "${fechaFin.year.toString().padLeft(4, '0')}-${fechaFin.month.toString().padLeft(2, '0')}-${fechaFin.day.toString().padLeft(2, '0')}",
        "precioTotal": precioTotal,
        "precioLimpieza": precioLimpieza,
        "precioNoches": precioNoches,
        "precioServicio": precioServicio,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "cliente": cliente.toJson(),
        "lugar": lugar.toJson(),
      };
}

class Cliente {
  Cliente({
    required this.id,
    required this.email,
    required this.password,
    required this.nombrecompleto,
    required this.telefono,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String email;
  String password;
  String nombrecompleto;
  String telefono;
  DateTime createdAt;
  DateTime updatedAt;

  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        nombrecompleto: json["nombrecompleto"],
        telefono: json["telefono"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "nombrecompleto": nombrecompleto,
        "telefono": telefono,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Lugar {
  Lugar({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.cantPersonas,
    required this.cantCamas,
    required this.cantBanios,
    required this.cantHabitaciones,
    required this.tieneWifi,
    required this.cantVehiculosParqueo,
    required this.precioNoche,
    required this.costoLimpieza,
    required this.ciudad,
    required this.latitud,
    required this.longitud,
    required this.arrendatarioId,
    required this.createdAt,
    required this.updatedAt,
    required this.arrendatario,
  });

  int id;
  String nombre;
  String descripcion;
  int cantPersonas;
  int cantCamas;
  int cantBanios;
  int cantHabitaciones;
  int tieneWifi;
  int cantVehiculosParqueo;
  String precioNoche;
  String costoLimpieza;
  String ciudad;
  String latitud;
  String longitud;
  int arrendatarioId;
  DateTime createdAt;
  DateTime updatedAt;
  Cliente arrendatario;

  factory Lugar.fromJson(Map<String, dynamic> json) => Lugar(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        cantPersonas: json["cantPersonas"],
        cantCamas: json["cantCamas"],
        cantBanios: json["cantBanios"],
        cantHabitaciones: json["cantHabitaciones"],
        tieneWifi: json["tieneWifi"],
        cantVehiculosParqueo: json["cantVehiculosParqueo"],
        precioNoche: json["precioNoche"],
        costoLimpieza: json["costoLimpieza"],
        ciudad: json["ciudad"],
        latitud: json["latitud"],
        longitud: json["longitud"],
        arrendatarioId: json["arrendatario_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        arrendatario: Cliente.fromJson(json["arrendatario"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "cantPersonas": cantPersonas,
        "cantCamas": cantCamas,
        "cantBanios": cantBanios,
        "cantHabitaciones": cantHabitaciones,
        "tieneWifi": tieneWifi,
        "cantVehiculosParqueo": cantVehiculosParqueo,
        "precioNoche": precioNoche,
        "costoLimpieza": costoLimpieza,
        "ciudad": ciudad,
        "latitud": latitud,
        "longitud": longitud,
        "arrendatario_id": arrendatarioId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "arrendatario": arrendatario.toJson(),
      };
}
