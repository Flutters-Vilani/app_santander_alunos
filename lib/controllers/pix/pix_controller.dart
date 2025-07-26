import 'package:app_santander/controllers/request.dart';

class PixController {
  Request request = Request();

  transferePix() async {
    await request.methodRequest("transacoes", "POST", body: {
      "idusuarioOrigem": "6",
      "idusuarioDestino": "12",
      "valor": "10000"
    });
  }
}
