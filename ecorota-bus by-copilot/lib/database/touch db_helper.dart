import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "ecorota_bus.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Tabela Viagens
    await db.execute('''
      CREATE TABLE viagens (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        origem TEXT,
        destino TEXT,
        km_inicial REAL,
        km_final REAL,
        km_total REAL,
        meta_consumo REAL,
        media_consumo REAL,
        id_usuario INTEGER,
        data_operacao TEXT
      )
await db.execute('''
  CREATE TABLE usuarios(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    email TEXT,
    preferencia TEXT
  )
    ''');

    // Tabela Relatórios
    await db.execute('''
      CREATE TABLE relatorios (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        mes INTEGER,
        ano INTEGER,
        id_usuario INTEGER,
        km_total_mes REAL,
        media_consumo_mes REAL,
        meta_consumo_mes REAL,
        resultado_geral TEXT,
        horas_total_mes REAL
      )
    ''');
  }
}
