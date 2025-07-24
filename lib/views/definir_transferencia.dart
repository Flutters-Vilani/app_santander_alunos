import 'package:app_santander/views/revisao_pix.dart';
import 'package:flutter/material.dart';

class DefinirTransferencia extends StatefulWidget {
  const DefinirTransferencia({super.key});

  @override
  State<DefinirTransferencia> createState() => _DefinirTransferenciaState();
}

class _DefinirTransferenciaState extends State<DefinirTransferencia> {
  TextEditingController controllerValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 236, 9, 0),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Definir transferência",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Para",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Guilherme Viana Vilani",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                Text(
                  "CPF: ***.489.031-** - NU PAGAMENTOS - IP",
                  style: TextStyle(
                    color: Colors.grey.shade800,
                  ),
                ),
                Text(
                  "Chave: ***.489.031-**",
                  style: TextStyle(
                    color: Colors.grey.shade800,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Adicionar mensagem",
                  style: TextStyle(
                    color: Color.fromARGB(255, 236, 9, 0),
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromARGB(255, 236, 9, 0),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Qual o valor?",
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 16,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(5),
                      hintText: "Valor",
                      // prefixText: "R\$",
                    ),
                    onChanged: (value) {
                      setState(() {
                        controllerValor.text = value;
                      });
                    },
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Quando vai ser feito",
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_today_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Hoje, 18 de Jul",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    Text(
                      "Agendar",
                      style: TextStyle(
                          color: Color.fromARGB(255, 236, 9, 0),
                          decoration: TextDecoration.underline,
                          decorationColor: Color.fromARGB(255, 236, 9, 0),
                          fontSize: 16),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Como você quer pagar?",
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 16,
                      ),
                    ),
                    Icon(
                      Icons.remove_red_eye_outlined,
                      color: Color.fromARGB(255, 236, 9, 0),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                // container conta corrente
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Radio(
                            activeColor: Color.fromARGB(255, 236, 9, 0),
                            value: true,
                            groupValue: true,
                            onChanged: (value) {},
                            hoverColor: Color.fromARGB(255, 236, 9, 0),
                          ),
                          Text(
                            "Conta Corrente",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Saldo disponivel"),
                          Container(
                            width: 150,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Saldo + Limite"),
                          Container(
                            width: 150,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Divider(),
                GestureDetector(
                  onTap: controllerValor.text.isEmpty
                      ? null
                      : () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => RevisaoPix(
                                valor: double.parse(controllerValor.text),
                              ),
                            ),
                          );
                        },
                  child: Container(
                    margin: EdgeInsets.only(top: 18),
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                      color: controllerValor.text.isEmpty
                          ? Colors.grey
                          : Color.fromARGB(255, 236, 9, 0),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: double.maxFinite,
                    child: Text(
                      "Continuar",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
