import 'dart:convert';

import 'package:http/http.dart' as http;

class Request {
  String BASE_URL = "http://10.38.0.130:8000/api";

  methodRequest(String route, String method,
      {dynamic body, dynamic parameters}) async {
    if (method == "GET") {
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
