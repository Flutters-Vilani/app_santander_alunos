import 'dart:convert';

import 'package:app_santander/controllers/request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController {
  Request request = Request();
  getUserLogado() async {
    final prefs = await SharedPreferences.getInstance();
    dynamic user = await request.methodRequest("usuarios/sessao", "GET");

    dynamic userDecoded = jsonDecode(user["body"]);

    await prefs.setString("id", userDecoded["id"]);
    await prefs.setString("cpf", userDecoded["cpf"]);
    await prefs.setString("nome", userDecoded["nome"]);
    await prefs.setString("email", userDecoded["email"]);
    await prefs.setString("telefone", userDecoded["telefone"]);
    await prefs.setString("numeroConta", userDecoded["numeroConta"]);
    await prefs.setString("saldo", userDecoded["saldo"]);
  }
}
