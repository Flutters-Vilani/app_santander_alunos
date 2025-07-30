import 'dart:convert';
import '../controllers/request.dart';
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

  Request request = Request();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: Column(
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
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await request.methodRequest(
                      "usuarios",
                      "POST",
                      body: {
                        "nome": nomeController.text,
                        "cpf": cpfController.text,
                        "email": emailController.text,
                        "senha": senhaController.text,
                        "telefone": telefoneController.text
                      },
                    );

                    Navigator.of(context).pop();
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Color.fromARGB(255, 236, 9, 0),
                        content: Text(
                          "Não foi possível fazer o cadastro. Tente novamente!",
                        ),
                      ),
                    );
                  }
                },
                child: Text("Cadastrar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
