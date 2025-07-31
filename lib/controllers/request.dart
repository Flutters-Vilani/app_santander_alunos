import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

class Request {
  String BASE_URL = "http://santa.avanth.kinghost.net/api";

  methodRequest(String route, String method, {dynamic body}) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    dynamic resposta;
    try {
      if (method == "GET") {
        await http.get(Uri.parse("$BASE_URL/$route"), headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          // "Authorization": "Bearer ${prefs.getString("token")}" // with SP
          "Authorization":
              "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE3NTM5MjQ4MzAsImV4cCI6MTc1MzkyODQzMCwicm9sZXMiOlsiVVNVQVJJTyJdLCJ1c2VybmFtZSI6IjA3ODQ4OTAzMTYyIn0.Qd1iHlexLMGrhACc4Ch6GsWL-zANpWLe47UyUKTzV7bau8P0qBos-7jMHUj4lgQc5VBbMLVoZZkPJjD3dLxVCIHPrxO5ANFSW-_j6NLhImJuOWlHs1pVMPUXHr_UhBG-aCXY3TB--xNWv4MNSTmTNKwgHbEMg_Wsyld9mm2Pa4sx_clPFL05q1OLDBNkzQHw8wO2EX-UuIVikTloR66SoxG7PnOuHatDiF1THtV4H2eApRSEAE1fKOeD5eBc00puKiK8QoH6BLcjJ5B5BQJNSGjXCI5RcoBZI1vcsxRFoijdZg-Ax9mJmbiE5vDqiF7bBgmrdFrgkbtOE2juyeywxg" // without SP
        }).then((http.Response response) {
          print(response.statusCode);

          var respDecoded = jsonDecode(response.body);

          resposta = {"statusCode": response.statusCode, "body": respDecoded};
        });
      } else {
        await http
            .post(
          Uri.parse("$BASE_URL/$route"),
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            // "Authorization": "Bearer ${prefs.getString("token")}" // with SP
            "Authorization":
                "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE3NTM5MjQ4MzAsImV4cCI6MTc1MzkyODQzMCwicm9sZXMiOlsiVVNVQVJJTyJdLCJ1c2VybmFtZSI6IjA3ODQ4OTAzMTYyIn0.Qd1iHlexLMGrhACc4Ch6GsWL-zANpWLe47UyUKTzV7bau8P0qBos-7jMHUj4lgQc5VBbMLVoZZkPJjD3dLxVCIHPrxO5ANFSW-_j6NLhImJuOWlHs1pVMPUXHr_UhBG-aCXY3TB--xNWv4MNSTmTNKwgHbEMg_Wsyld9mm2Pa4sx_clPFL05q1OLDBNkzQHw8wO2EX-UuIVikTloR66SoxG7PnOuHatDiF1THtV4H2eApRSEAE1fKOeD5eBc00puKiK8QoH6BLcjJ5B5BQJNSGjXCI5RcoBZI1vcsxRFoijdZg-Ax9mJmbiE5vDqiF7bBgmrdFrgkbtOE2juyeywxg" // without SP
          },
          body: jsonEncode(body),
        )
            .then((http.Response response) {
          print(response.statusCode);
          // print(response.body);

          var respDecoded = jsonDecode(response.body);

          resposta = {"statusCode": response.statusCode, "body": respDecoded};
        });
      }
    } catch (e) {}

    return resposta;
  }
}
