import 'package:sqflite/sqflite.dart';
import '../database/db_helper.dart';
import '../models/relatorio.dart';

class RelatorioDAO {
  final DBHelper _dbHelper = DBHelper();

  // Inserir ou atualizar resumo mensal
  Future<void> salvarResumo(Map<String, dynamic> resumo) async {
    final db = await _dbHelper.db;
    await db.insert(
      'relatorios',
      resumo,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Carregar resumo mensal
  Future<Map<String, dynamic>> carregarResumo(int mes, int ano, int idUsuario) async {
    final db = await _dbHelper.db;
    final result = await db.query(
      'relatorios',
      where: "mes = ? AND ano = ? AND id_usuario = ?",
      whereArgs: [mes, ano, idUsuario],
    );

    if (result.isNotEmpty) {
      return result.first;
    } else {
      return {
        'km_total_mes': 0.0,
        'media_consumo_mes': 0.0,
        'meta_consumo_mes': 0.0,
        'resultado_geral': 'Sem dados',
        'horas_total_mes': 0.0,
      };
    }
  }
}
