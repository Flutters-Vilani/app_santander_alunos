import 'package:app_santander/views/dashboard.dart';
import 'package:flutter/material.dart';

class Comprovante extends StatefulWidget {
  const Comprovante({super.key});

  @override
  State<Comprovante> createState() => _ComprovanteState();
}

class _ComprovanteState extends State<Comprovante> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 236, 9, 0),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Dashboard()));
          },
          icon: Icon(
            Icons.close,
            size: 40,
          ),
        ),
        title: Text(
          "Comprovante",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle_outline_rounded,
                          color: Colors.green,
                          size: 40,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Pronto! Seu pagamento foi realizado.")
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Comprovante do Pix",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Você pode consultar o comprovante da sua transação em Início > Pix > Extrato Pix.",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Valor pago",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "R\$ 0,01",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Para",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "Guilherme Viana Vilani",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "CPF",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "***.489.031-**",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Instituição",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "NU PAGAMENTOS - IP",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "ID/Transação",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "ERJGEKRE54FE6FER4FA7D6A98Y",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Data e hora da transação",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "23/07/2025 - 11:17:35",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Código de autenticação",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "AS67A5S67AD7SGDA67FA",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 236, 9, 0),
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  "Salvar ou compartilhar",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Color.fromARGB(255, 236, 9, 0),
                  ),
                ),
                child: Text(
                  "Fazer novo Pix",
                  style: TextStyle(
                      color: Color.fromARGB(255, 236, 9, 0), fontSize: 16),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Ver comprovante completo",
                style: TextStyle(
                  color: Color.fromARGB(255, 236, 9, 0),
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                  decorationColor: Color.fromARGB(255, 236, 9, 0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
