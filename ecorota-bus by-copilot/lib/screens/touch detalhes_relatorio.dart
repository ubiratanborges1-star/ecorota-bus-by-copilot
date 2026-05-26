import 'package:flutter/material.dart';

class DetalhesRelatorioPage extends StatelessWidget {
  final Map<String, dynamic> relatorio;

  const DetalhesRelatorioPage({Key? key, required this.relatorio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalhes do Relatório")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Resumo Mensal", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text("Km Total: ${relatorio['km_total_mes']}", style: TextStyle(fontSize: 16)),
            Text("Consumo Médio: ${relatorio['media_consumo_mes']}", style: TextStyle(fontSize: 16)),
            Text("Meta de Consumo: ${relatorio['meta_consumo_mes']}", style: TextStyle(fontSize: 16)),
            Text("Resultado Geral: ${relatorio['resultado_geral']}", style: TextStyle(fontSize: 16)),
            Text("Horas Totais: ${relatorio['horas_total_mes']}", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
