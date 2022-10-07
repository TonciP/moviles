import 'package:peliculas/models/pelicula.dart';
import 'package:peliculas/models/peliculadb.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'pelicula.db'),
        onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE peliculadb (id INTEGER PRIMARY KEY UNIQUE , titulo TEXT, ano TEXT, duracion TEXT, genero TEXT, director TEXT, sinopsis TEXT, imagen TEXT, rating TEXT)",
      );
    }, version: 1);
  }

  static Future<int> insert(Peliculadb peliculadb) async {
    Database database = await _openDB();

    return database.insert("peliculadb", peliculadb.toMap());
  }

  static Future<int> delete(Peliculadb peliculadb) async {
    Database database = await _openDB();

    return database
        .delete("peliculadb", where: "id = ?", whereArgs: [peliculadb.id]);
  }

  static Future<int> update(Peliculadb peliculadb) async {
    Database database = await _openDB();

    return database.update("peliculadb", peliculadb.toJson(),
        where: "id = ?", whereArgs: [peliculadb.id]);
  }

  static Future<List<Peliculadb>> peliculas() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> peliculasdb =
        await database.query("peliculadb");

    return List.generate(
        peliculasdb.length,
        (i) => Peliculadb(
              id: peliculasdb[i]['id'],
              titulo: peliculasdb[i]['titulo'],
              ano: peliculasdb[i]['ano'],
              duracion: peliculasdb[i]['duracion'],
              genero: peliculasdb[i]['genero'],
              director: peliculasdb[i]['director'],
              sinopsis: peliculasdb[i]['sinopsis'],
              imagen: peliculasdb[i]['imagen'],
              rating: peliculasdb[i]['rating'],
            ));
  }

  static Future<Peliculadb> select(int id) async {
    Database database = await _openDB();
    final Peliculadb peliculasdb = (await database
        .rawQuery("select * from peliculadb where id = ${id}")) as Peliculadb;

    return peliculasdb;
  }

  // CON SENTENCIAS
  static Future<void> insertar2(Peliculadb peliculadb) async {
    Database database = await _openDB();
    var resultado = await database.rawInsert(
        "INSERT INTO peliculadb (id, titulo, ano, duracion, genero, director, sinopsis, imagen, rating)"
        " VALUES (${peliculadb.id},${peliculadb.titulo}, ${peliculadb.ano}, ${peliculadb.genero}, , ${peliculadb.director}, ${peliculadb.sinopsis}, ${peliculadb.imagen}, ${peliculadb.rating})");
  }
}
