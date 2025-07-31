import 'package:app_santander/controllers/request.dart';

class PixController {
  Request request = Request();

  transferePix(dynamic valor, dynamic idDestino) async {
    dynamic resposta = await request.methodRequest("transacoes", "POST", body: {
      "idusuarioOrigem": "6",
      "idusuarioDestino": "$idDestino",
      "valor": "$valor"
    });

    return resposta;
  }
}
