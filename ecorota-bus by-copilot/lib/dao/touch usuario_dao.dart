import 'package:sqflite/sqflite.dart';
import '../database/database_helper.dart';
import '../models/usuario.dart';

class UsuarioDAO {
  // Inserir ou atualizar usuário
  Future<void> salvarUsuario(Usuario usuario) async {
    final db = await DatabaseHelper.instance.database;
    await db.insert(
      'usuarios',
      usuario.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Buscar usuário pelo ID
  Future<Usuario?> buscarUsuario(int id) async {
    final db = await DatabaseHelper.instance.database;
    final maps = await db.query(
      'usuarios',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Usuario.fromMap(maps.first);
    }
    return null;
  }

  // Buscar todos os usuários (se precisar)
  Future<List<Usuario>> listarUsuarios() async {
    final db = await DatabaseHelper.instance.database;
    final maps = await db.query('usuarios');
    return maps.map((map) => Usuario.fromMap(map)).toList();
  }
}
