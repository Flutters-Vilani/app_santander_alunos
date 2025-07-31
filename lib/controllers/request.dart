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
              "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE3NTM5MjExNDMsImV4cCI6MTc1MzkyNDc0Mywicm9sZXMiOlsiVVNVQVJJTyJdLCJ1c2VybmFtZSI6IjYwOTQxMTg5MTA0In0.alSIQdVpcw-pwIwNsA8AtT2AefNZlYjW9xFShAMo8BXStRvJd2eIbxoq5RLoDme__0GtZvRt1MOcVv7AuTajA8JgeyFCFMeHdQdvhx9c_zSa-3UxDQ1QyupfDrFPpiKOBWuo3HlIYuPTmoyC-qoBbGflLpcOIeAiKINtTmVnHORuMC1_lgDsqUY86_0A-yWld645fGf8cG9KQmmH-b0RzevXmLk5MpAHf6dNOw-Bo3qCJmslTAOQIvC2CxFIRY_RL27Haa-Rp--G-vUrUeIj1Kx1Jo3Wt1N67ATU4dQt5hKSkYqaqnqgUWVGSP53b6PhBAqXT_GlY5FvRiaWy5fRkQ" // without SP
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
                "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE3NTM5MjExNDMsImV4cCI6MTc1MzkyNDc0Mywicm9sZXMiOlsiVVNVQVJJTyJdLCJ1c2VybmFtZSI6IjYwOTQxMTg5MTA0In0.alSIQdVpcw-pwIwNsA8AtT2AefNZlYjW9xFShAMo8BXStRvJd2eIbxoq5RLoDme__0GtZvRt1MOcVv7AuTajA8JgeyFCFMeHdQdvhx9c_zSa-3UxDQ1QyupfDrFPpiKOBWuo3HlIYuPTmoyC-qoBbGflLpcOIeAiKINtTmVnHORuMC1_lgDsqUY86_0A-yWld645fGf8cG9KQmmH-b0RzevXmLk5MpAHf6dNOw-Bo3qCJmslTAOQIvC2CxFIRY_RL27Haa-Rp--G-vUrUeIj1Kx1Jo3Wt1N67ATU4dQt5hKSkYqaqnqgUWVGSP53b6PhBAqXT_GlY5FvRiaWy5fRkQ" // without SP
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
