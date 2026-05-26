import '../widgets/custom_card.dart';
import '../utils/date_utils.dart';
import 'package:flutter/material.dart';
import '../controllers/viagem_controller.dart';
import '../models/viagem.dart';

class HistoricoViagensPage extends StatefulWidget {
  final int mes;
  final int ano;
  final int idUsuario;

  HistoricoViagensPage({required this.mes, required this.ano, required this.idUsuario});

  @override
  _HistoricoViagensPageState createState() => _HistoricoViagensPageState();
}

class _HistoricoViagensPageState extends State<HistoricoViagensPage> {
  final ViagemController viagemController = ViagemController();
  List<Viagem> viagens = [];

  @override
  void initState() {
    super.initState();
    carregarViagens();
  }

  Future<void> carregarViagens() async {
    final lista = await viagemController.listarViagens(widget.mes, widget.ano, widget.idUsuario);
    setState(() {
      viagens = lista;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Histórico de Viagens")),
      body: viagens.isEmpty
          ? Center(child: Text("Nenhuma viagem registrada"))
          : ListView.builder(
              itemCount: viagens.length,
              itemBuilder: (context, index) {
                final v = viagens[index];
                final dentroMeta = v.mediaConsumo >= v.metaConsumo;
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.circle, color: dentroMeta ? Colors.green : Colors.red),
                    import '../utils/date_utils.dart'; // adicione no topo do arquivo

...

return CustomCard(
  title: "${DateUtilsHelper.formatDate(v.dataOperacao)} - ${v.origem} → ${v.destino}",
  subtitle: "Km total: ${v.kmTotal} | Consumo: ${v.mediaConsumo.toStringAsFixed(2)}",
  icon: Icons.directions_bus,
  color: Colors.blue,
  onTap: () {
    // Aqui você pode abrir detalhes da viagem futuramente
  },
);
                  ),
                );
              },
            ),
    );
  }
}
