import 'package:flutter/material.dart';
import '../models/viagem.dart';
import '../utils/date_utils.dart';

class DetalhesViagemPage extends StatelessWidget {
  final Viagem viagem;

  const DetalhesViagemPage({Key? key, required this.viagem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalhes da Viagem")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${DateUtilsHelper.formatDate(viagem.dataOperacao)}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text("Origem: ${viagem.origem}", style: TextStyle(fontSize: 16)),
            Text("Destino: ${viagem.destino}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 12),
            Text("Km Inicial: ${viagem.kmInicial}", style: TextStyle(fontSize: 16)),
            Text("Km Final: ${viagem.kmFinal}", style: TextStyle(fontSize: 16)),
            Text("Km Total: ${viagem.kmTotal}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 12),
            Text("Meta de Consumo: ${viagem.metaConsumo}", style: TextStyle(fontSize: 16)),
            Text("Média de Consumo: ${viagem.mediaConsumo}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 12),
            Text("Usuário ID: ${viagem.idUsuario}", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
