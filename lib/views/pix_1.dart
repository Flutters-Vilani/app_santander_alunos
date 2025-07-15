import 'package:flutter/material.dart';

class Pix1 extends StatefulWidget {
  const Pix1({super.key});

  @override
  State<Pix1> createState() => _Pix1State();
}

class _Pix1State extends State<Pix1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
                  borderRadius: BorderRadius.circular(5)),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Nome, Chave ou Pix copia e cola"),
              ),
            ),
            SizedBox(height: 5,),
            Text("Celular, CPF/CNPJ, e-mail, chave aleatória...")
          ],
        ),
      ),
    );
  }
}
