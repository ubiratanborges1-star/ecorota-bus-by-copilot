import 'package:sqflite/sqflite.dart';
import '../database/db_helper.dart';
import '../models/viagem.dart';

class ViagemDAO {
  final DBHelper _dbHelper = DBHelper();

  // Inserir viagem
  Future<void> inserirViagem(Viagem viagem) async {
    final db = await _dbHelper.db;
    await db.insert('viagens', viagem.toMap());
  }

  // Listar viagens por mês/ano/usuário
  Future<List<Viagem>> listarViagens(int mes, int ano, int idUsuario) async {
    final db = await _dbHelper.db;
    final result = await db.query(
      'viagens',
      where: "id_usuario = ? AND substr(data_operacao, 6, 2) = ? AND substr(data_operacao, 1, 4) = ?",
      whereArgs: [idUsuario, mes.toString().padLeft(2, '0'), ano.toString()],
    );
    return result.map((map) => Viagem.fromMap(map)).toList();
  }
}
