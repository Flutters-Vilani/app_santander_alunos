import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

class Request {
  String BASE_URL = "http://santa.avanth.kinghost.net/api";
  String token = "";

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
      // final prefs = await SharedPreferences.getInstance();
      await http
          .post(
        Uri.parse("$BASE_URL/$route"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE3NTM3NTI5NTcsImV4cCI6MTc1Mzc1NjU1Nywicm9sZXMiOlsiVVNVQVJJTyJdLCJ1c2VybmFtZSI6IjA3ODQ4OTAzMTYyIn0.swX7oJRIFrr-JOuF-h7pf1Q7n_OrDd7yDvS-kthFEl1iTJLArkB7IxJHxI37znM-3sa7pOYdUsUWrGnOYAtp9cLbs3s_FqtHjUvsdXi9bKXiKkcau_I2IeLFsaMoB9TVxqsQBC86ROfRyAO1sPc0LfaLdVJNXzXNgCOAO4QrHtUpWXuqfjB6w58q4yK-Z-VGUrPzx7Ok46fcLnm8pgI2CLplEvHAj2wDGRAcGs6K6QGV_zjuKlXzDzrxMHXKEWFrRzffBTsdjgJGOpleLnqHNq0AbNnCCODqhJ6Jga2CULM7bCz19qeKYMJuG0t5fBRAnIUsSDcQwDynfMO4ZJdwWg"
          // "Authorization": "Bearer ${prefs.getString("token")!}"
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
