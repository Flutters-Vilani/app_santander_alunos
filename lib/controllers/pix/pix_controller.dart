import 'dart:convert';

import 'package:app_santander/controllers/request.dart';
import 'package:app_santander/controllers/user/user_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PixController {
  Request request = Request();

  UserController userController = UserController();

  transferePix(dynamic usuarioDestino, dynamic valor) async {
    final prefs = await SharedPreferences.getInstance();

    dynamic userDestinoDecoded = jsonDecode(usuarioDestino);

    print("TRANS " + userDestinoDecoded[0]["id"]);
    dynamic resposta = await request.methodRequest(
      "transacoes",
      "POST",
      body: {
        "idusuarioOrigem": "${prefs.getString("id")}",
        "idusuarioDestino": "${userDestinoDecoded[0]["id"]}",
        "valor": "$valor"
      },
    );

    await userController.getUserLogado();

    return resposta;
  }
}
