import '../dao/relatorio_dao.dart';

class RelatorioController {
  final RelatorioDAO relatorioDAO = RelatorioDAO();

  // Carregar resumo mensal
  Future<Map<String, dynamic>> carregarResumo(int mes, int ano, int idUsuario) async {
    return await relatorioDAO.carregarResumo(mes, ano, idUsuario);
  }

  // Salvar resumo mensal
  Future<void> salvarResumo(Map<String, dynamic> resumo) async {
    await relatorioDAO.salvarResumo(resumo);
  }
}
