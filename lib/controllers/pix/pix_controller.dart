import 'package:app_santander/controllers/request.dart';

class PixController {
  Request request = Request();

  transferePix(dynamic idOrigem, dynamic idDestino, dynamic valor) async {
    dynamic resposta = await request.methodRequest("transacoes", "POST", body: {
      "idusuarioOrigem": "$idOrigem",
      "idusuarioDestino": "$idDestino",
      "valor": "$valor"
    });

    return resposta;
  }
}
