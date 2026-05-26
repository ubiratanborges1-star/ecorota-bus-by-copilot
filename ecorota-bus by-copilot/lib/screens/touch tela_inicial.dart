import 'package:flutter/material.dart';

class TelaInicialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EcoRota Bus")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/cadastro'),
              icon: Icon(Icons.add),
              label: Text("Cadastrar Viagem"),
            ),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/historico'),
              icon: Icon(Icons.history),
              label: Text("Histórico de Viagens"),
            ),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/relatorio'),
              icon: Icon(Icons.bar_chart),
              label: Text("Relatório Mensal"),
            ),
          ],
        ),
      ),
    );
  }
}
