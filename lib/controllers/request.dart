import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class Request {
  String BASE_URL = "http://santa.avanth.kinghost.net/api";

  methodRequest(String route, String method, {dynamic body}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dynamic resposta;
    if (method == "GET") {
      await http.get(Uri.parse("$BASE_URL/$route"), headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer ${prefs.getString("token")}"
      }).then((http.Response response) {
        // print(response.statusCode);

        var respDecoded = jsonDecode(response.body);
        resposta = {"statusCode": response.statusCode, "body": response.body};
      });
    } else {
      print("$BASE_URL/$route");
      print(body);
      await http
          .post(
        Uri.parse("$BASE_URL/$route"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer ${prefs.getString("token")}"
        },
        body: jsonEncode(body),
      )
          .then((http.Response response) {
        // print(response.statusCode);

        var respDecoded = jsonDecode(response.body);
        resposta = {"statusCode": response.statusCode, "body": respDecoded};
      });
    }

    return resposta;
  }
}
