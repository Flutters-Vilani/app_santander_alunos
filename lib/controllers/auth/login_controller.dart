import 'package:app_santander/controllers/request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  Request request = Request();

  login(dynamic body) async {
    dynamic resposta = await request.methodRequest(
      "auth/login",
      "POST",
      body: body,
    );

    return resposta;
  }
}
