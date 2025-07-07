import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CadastroConta extends StatefulWidget {
  const CadastroConta({super.key});

  @override
  State<CadastroConta> createState() => _CadastroContaState();
}

class _CadastroContaState extends State<CadastroConta> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController cpfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: nomeController,
            decoration: InputDecoration(hintText: "Nome"),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(hintText: "Email"),
          ),
          TextField(
            controller: senhaController,
            decoration: InputDecoration(hintText: "Senha"),
          ),
          TextField(
            controller: telefoneController,
            decoration: InputDecoration(hintText: "Telefone"),
          ),
          TextField(
            controller: cpfController,
            decoration: InputDecoration(hintText: "CPF"),
          ),
          ElevatedButton(
            onPressed: () async {
              await http
                  .post(
                Uri.parse("http://localhost:8000/api/usuarios"),
                headers: {
                  "Accept": "application/json",
                  "Content-Type": "application/json"
                },
                body: jsonEncode(
                  {
                    "nome": nomeController.text,
                    "cpf": cpfController.text,
                    "email": emailController.text,
                    "senha": senhaController.text,
                    "telefone": telefoneController.text
                  },
                ),
              )
                  .then((http.Response response) {
                print(response.statusCode);
              });
            },
            child: Text("Cadastrar"),
          )
        ],
      ),
    );
  }
}
