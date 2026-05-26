import '../widgets/custom_card.dart';
import '../utils/date_utils.dart';
import 'package:flutter/material.dart';
import '../controllers/relatorio_controller.dart';
import '../controllers/viagem_controller.dart';
import '../models/viagem.dart';

class RelatorioMensalPage extends StatefulWidget {
  final int mes;
  final int ano;
  final int idUsuario;

  RelatorioMensalPage({required this.mes, required this.ano, required this.idUsuario});

  @override
  _RelatorioMensalPageState createState() => _RelatorioMensalPageState();
}

class _RelatorioMensalPageState extends State<RelatorioMensalPage> {
  final RelatorioController relatorioController = RelatorioController();
  final ViagemController viagemController = ViagemController();

  Map<String, dynamic> resumo = {};
  List<Viagem> viagens = [];

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  Future<void> carregarDados() async {
    final lista = await viagemController.listarViagens(widget.mes, widget.ano, widget.idUsuario);
    final relatorio = await relatorioController.carregarResumo(widget.mes, widget.ano, widget.idUsuario);

    setState(() {
      viagens = lista;
      resumo = relatorio;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Relatório Mensal - ${widget.mes}/${widget.ano}")),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(12),
            child: ListTile(
              title: Text("Totais do mês"),
              subtitle: Text(
                "Km: ${resumo['km_total_mes']} | Média: ${resumo['media_consumo_mes']} km/L\n"
                "Meta: ${resumo['meta_consumo_mes']} km/L | Resultado: ${resumo['resultado_geral']}\n"
                "Horas: ${resumo['horas_total_mes']}",
              ),
            ),
          ),
          Expanded(
            child: viagens.isEmpty
                ? Center(child: Text("Nenhuma viagem registrada"))
                : ListView.builder(
                    itemCount: viagens.length,
                    itemBuilder: (context, index) {
                      final v = viagens[index];
                      final dentroMeta = v.mediaConsumo >= v.metaConsumo;
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.circle, color: dentroMeta ? Colors.green : Colors.red),
                          title: Text("${DateUtilsHelper.formatDate(v.dataOperacao)} - ${v.origem} → ${v.destino}"),
                          return CustomCard(
  title: "${DateUtilsHelper.formatDate(v.dataOperacao)} - ${v.origem} → ${v.destino}",
  subtitle: "Km total: ${v.kmTotal} | Consumo: ${v.mediaConsumo.toStringAsFixed(2)}",
  icon: Icons.assessment,
  color: Colors.orange,
  onTap: () {
    // Aqui você pode abrir detalhes do relatório futuramente
  },
);
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
