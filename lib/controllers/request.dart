import 'dart:convert';

import 'package:http/http.dart' as http;

class Request {
  String BASE_URL = "http://10.38.0.130:8000/api";

  methodRequest(String route, String method, {dynamic body}) async {
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
          "Content-Type": "application/json"
        },
        body: jsonEncode(body),
      )
          .then((http.Response response) {
        print(response.statusCode);
      });
    }
  }
}
