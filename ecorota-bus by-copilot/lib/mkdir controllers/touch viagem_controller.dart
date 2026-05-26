import '../models/viagem.dart';
import '../dao/viagem_dao.dart';

class ViagemController {
  final ViagemDAO viagemDAO = ViagemDAO();

  // Criar objeto Viagem
  Viagem criarViagem(String origem, String destino, double kmInicial, double kmFinal,
      double metaConsumo, int idUsuario) {
    final kmTotal = kmFinal - kmInicial;
    final mediaConsumo = kmTotal > 0 ? kmTotal / (kmTotal / metaConsumo) : 0;

    return Viagem(
      origem: origem,
      destino: destino,
      kmInicial: kmInicial,
      kmFinal: kmFinal,
      kmTotal: kmTotal,
      metaConsumo: metaConsumo,
      mediaConsumo: mediaConsumo,
      idUsuario: idUsuario,
      dataOperacao: DateTime.now().toString(),
    );
  }

  // Salvar viagem no banco
  Future<void> salvarViagem(Viagem viagem) async {
    await viagemDAO.inserirViagem(viagem);
  }

  // Listar viagens por mês/ano/usuário
  Future<List<Viagem>> listarViagens(int mes, int ano, int idUsuario) async {
    return await viagemDAO.listarViagens(mes, ano, idUsuario);
  }
}
