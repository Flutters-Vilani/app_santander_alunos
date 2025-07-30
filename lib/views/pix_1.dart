import 'dart:convert';

import 'package:app_santander/controllers/request.dart';
import 'package:app_santander/views/definir_transferencia.dart';
import 'package:flutter/material.dart';

class Pix1 extends StatefulWidget {
  const Pix1({super.key});

  @override
  State<Pix1> createState() => _Pix1State();
}

class _Pix1State extends State<Pix1> {
  TextEditingController controllerPix = TextEditingController();
  Request request = Request();

  List cardVoceTambemPodeUsar = [
    {
      "icon": Icons.account_balance_outlined,
      "title": "Agência\ne conta",
      "route": ""
    },
    {"icon": Icons.content_copy_outlined, "title": "Pix\ne cola", "route": ""},
    {"icon": Icons.qr_code_2_outlined, "title": "Código\nQR", "route": ""},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Pix",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 236, 9, 0),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Para quem você vai transferir?",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Nome, Chave ou Pix copia e cola",
                ),
                onChanged: (value) {
                  setState(() {
                    controllerPix.text = value;
                  });
                },
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text("Celular, CPF/CNPJ, e-mail, chave aleatória..."),
            controllerPix.text.isNotEmpty
                ? GestureDetector(
                    onTap: () async {
                      dynamic resposta = await request.methodRequest(
                        'usuarios?pesquisa=${controllerPix.text}',
                        'GET',
                      );

                      print(resposta["body"]);

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DefinirTransferencia(
                            usuarioDestino: resposta["body"],
                            chave: controllerPix.text,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 18),
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 236, 9, 0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      width: double.maxFinite,
                      child: Text(
                        "Continuar",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  )
                : Container(),
            SizedBox(
              height: 18,
            ),
            Text(
              "Você também pode usar",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cardVoceTambemPodeUsar.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => cardVoceTambemPodeUsar[index]['route'],
                        //   ),
                        // );
                      },
                      child: Card(
                        child: Container(
                          width: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(cardVoceTambemPodeUsar[index]['icon']),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                cardVoceTambemPodeUsar[index]['title'],
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              "Gerenciar",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.key_outlined),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Minhas Chaves",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text("Cadastre e gerencie suas chaves Pix")
                                ],
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                          )
                        ],
                      ),
                    ),
                    Divider()
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
