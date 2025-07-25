import 'package:app_santander/controllers/request.dart';

class PixController {
  Request request = Request();

  transferePix() async {
    await request.methodRequest("transacoes", "POST", body: {
      "idusuarioOrigem": "1",
      "idusuarioDestino": "2",
      "valor": "10000"
    });
  }
}
