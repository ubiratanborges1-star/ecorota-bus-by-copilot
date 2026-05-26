import 'widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'screens/cadastro_viagem.dart';
import 'screens/historico_viagens.dart';
import 'screens/relatorio_mensal.dart';

void main() {
  runApp(EcoRotaBusApp());
}

class EcoRotaBusApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoRota Bus',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/cadastro': (context) => CadastroViagemPage(),
        '/historico': (context) => HistoricoViagensPage(mes: 5, ano: 2026, idUsuario: 1),
        '/relatorio': (context) => RelatorioMensalPage(mes: 5, ano: 2026, idUsuario: 1),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EcoRota Bus")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          CustomButton(
  label: "Cadastrar Viagem",
  icon: Icons.add,
  onPressed: () => Navigator.pushNamed(context, '/cadastro'),
  color: Colors.green,
),
CustomButton(
  label: "Histórico de Viagens",
  icon: Icons.history,
  onPressed: () => Navigator.pushNamed(context, '/historico'),
  color: Colors.blue,
),
CustomButton(
  label: "Relatório Mensal",
  icon: Icons.bar_chart,
  onPressed: () => Navigator.pushNamed(context, '/relatorio'),
  color: Colors.orange, ),
            ),
          ],
        ),
      ),
    );
  }
}
