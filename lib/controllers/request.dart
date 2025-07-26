import 'dart:convert';
import 'package:http/http.dart' as http;

class Request {
  String BASE_URL = "http://santa.avanth.kinghost.net/api";
  String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE3NTM0OTQxNTgsImV4cCI6MTc1MzQ5Nzc1OCwicm9sZXMiOlsiVVNVQVJJTyJdLCJ1c2VybmFtZSI6IjA3ODQ4OTAzMTYyIn0.wvvp8JIMC2Bmk3SdCE18-_YVlhMKiZlV31nHdyCBbU7TiecRwCVXsQMMqDlZyzPDZYMQPt2us3S5VLw2yNzxA5jKaDuxoTuBpvfGco6KLH1iMGDKjcwsXciUtI0C2AA8I3U7FsiiTaCo47r2fkhZNlrhZkFyx9PDH2KPyDYEbw-XsAm0dUsvHek9jcGZhQN5m-ZxfQjgFNru7Z-nRsK75aGIsUl7lm2EzcQ6I4sgSti5hXLuzzCc2f5cafrNUIAl9bLOcvdVxAAldD-G_6WMhTppbAVGV3QSDmUYzmwiRmsxfrjHWyoB-ZCDqRHk7X4-fqZ4ApjrPTkz3J_RDEVJVg";

  methodRequest(String route, String method, {dynamic body}) async {
    dynamic resposta;
    if (method == "GET") {
      await http.get(Uri.parse("$BASE_URL/$route"), headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      }).then((http.Response response) {
        print(response.statusCode);
      });
    } else {
      await http
          .post(
        Uri.parse("$BASE_URL/$route"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
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

    return resposta;
  }
}
