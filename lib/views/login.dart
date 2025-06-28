import 'package:app_santander/views/dashboard.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool vrSwitchCpf = false;
  bool vrSwitchSenha = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios)),
        backgroundColor: Color.fromARGB(255, 236, 9, 0),
        iconTheme: IconThemeData(color: Colors.white),
        title: Image.asset(
          "santander_nome_login2.png",
          height: 60,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.place_outlined,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Acessar sua conta",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text("CPF"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Lembrar meu CPF",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                //switch lembrar meu CPF
                Switch(
                    value: vrSwitchCpf,
                    onChanged: (value) {
                      setState(() {
                        vrSwitchCpf = value;
                      });
                    })
              ],
            ),
            TextField(
              decoration: InputDecoration(
                label: Text("Senha"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Lembrar minha senha",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),

                // switch lembrar minha senha
                Switch(
                    value: vrSwitchSenha,
                    onChanged: (value) {
                      setState(() {
                        vrSwitchSenha = value;
                      });
                    })
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Esqueci minha senha",
              style: TextStyle(
                color: Colors.red,
                decoration: TextDecoration.underline,
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) => Dashboard()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red,
                    ),
                    child: Text(
                      "Entrar",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
