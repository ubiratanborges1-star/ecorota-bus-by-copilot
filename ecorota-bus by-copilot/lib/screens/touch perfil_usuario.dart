import '../dao/usuario_dao.dart';
import '../models/usuario.dart';
import 'package:flutter/material.dart';

class PerfilUsuarioPage extends StatefulWidget {
  const PerfilUsuarioPage({Key? key}) : super(key: key);

  @override
  State<PerfilUsuarioPage> createState() => _PerfilUsuarioPageState();
}

class _PerfilUsuarioPageState extends State<PerfilUsuarioPage> {
  final _formKey = GlobalKey<FormState>();
  String nome = "";
  String email = "";
  String preferencia = "";

  @override
  void initState() {
    super.initState();
    _carregarUsuario();
  }

  Future<void> _carregarUsuario() async {
    final dao = UsuarioDAO();
    final usuario = await dao.buscarUsuario(1); // ID fixo para exemplo
    if (usuario != null) {
      setState(() {
        nome = usuario.nome;
        email = usuario.email;
        preferencia = usuario.preferencia;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Perfil do Usuário")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: nome,
                decoration: InputDecoration(labelText: "Nome"),
                onChanged: (value) => nome = value,
              ),
              TextFormField(
                initialValue: email,
                decoration: InputDecoration(labelText: "Email"),
                onChanged: (value) => email = value,
              ),
              TextFormField(
                initialValue: preferencia,
                decoration: InputDecoration(labelText: "Preferência"),
                onChanged: (value) => preferencia = value,
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                icon: Icon(Icons.save),
                label: Text("Salvar"),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final usuario = Usuario(
                      id: 1,
                      nome: nome,
                      email: email,
                      preferencia: preferencia,
                    );
                    final dao = UsuarioDAO();
                    await dao.salvarUsuario(usuario);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Perfil atualizado com sucesso!")),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
