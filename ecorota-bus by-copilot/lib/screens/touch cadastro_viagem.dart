import 'package:flutter/material.dart';
import '../controllers/viagem_controller.dart';
import '../models/viagem.dart';

class CadastroViagemPage extends StatefulWidget {
  @override
  _CadastroViagemPageState createState() => _CadastroViagemPageState();
}

class _CadastroViagemPageState extends State<CadastroViagemPage> {
  final _formKey = GlobalKey<FormState>();
  final ViagemController viagemController = ViagemController();

  final origemController = TextEditingController();
  final destinoController = TextEditingController();
  final kmInicialController = TextEditingController();
  final kmFinalController = TextEditingController();
  final metaConsumoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro de Viagem")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(controller: origemController, decoration: InputDecoration(labelText: "Origem")),
              TextFormField(controller: destinoController, decoration: InputDecoration(labelText: "Destino")),
              TextFormField(controller: kmInicialController, decoration: InputDecoration(labelText: "Km Inicial"), keyboardType: TextInputType.number),
              TextFormField(controller: kmFinalController, decoration: InputDecoration(labelText: "Km Final"), keyboardType: TextInputType.number),
              TextFormField(controller: metaConsumoController, decoration: InputDecoration(labelText: "Meta Consumo (km/L)"), keyboardType: TextInputType.number),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final viagem = viagemController.criarViagem(
                      origemController.text,
                      destinoController.text,
                      double.parse(kmInicialController.text),
                      double.parse(kmFinalController.text),
                      double.parse(metaConsumoController.text),
                      1, // idUsuario fixo por enquanto
                    );
                    await viagemController.salvarViagem(viagem);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Viagem cadastrada!")));
                    Navigator.pop(context);
                  }
                },
                child: Text("Salvar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
