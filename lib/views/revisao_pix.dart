import 'package:flutter/material.dart';

class RevisaoPix extends StatefulWidget {
  const RevisaoPix({super.key});

  @override
  State<RevisaoPix> createState() => _RevisaoPixState();
}

class _RevisaoPixState extends State<RevisaoPix> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 236, 9, 0),
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
          "Revisão",
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
                Text(
                  "Para finalizar, confirme os dados",
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: 10,
                ),
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
                Divider(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Valor",
                  style: TextStyle(
                    color: Colors.grey.shade800,
                  ),
                ),
                Text(
                  "R\$ 1.000.000,00",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Forma de pagamento",
                  style: TextStyle(
                    color: Colors.grey.shade800,
                  ),
                ),
                Text(
                  "Ag 4317 Cc 01010101-8",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Data de envio",
                  style: TextStyle(
                    color: Colors.grey.shade800,
                  ),
                ),
                Text(
                  "Hoje - ${DateTime.now()}",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Facilite seus envios frequentes",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Agora você pode programar repetições de transferências que você faz regularmente.",
                        style: TextStyle(
                          color: Colors.grey.shade800,
                        ),
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
                          Text(
                            "Repetir Pix",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Switch(
                            value: switchValue,
                            onChanged: (value) {
                              setState(() {
                                switchValue = value;
                              });
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: double.maxFinite,
                  child: Text(
                    "Confira os dados acima antes de concluir a transação. Após a transferência , esta ação não poderá ser desfeita.",
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => RevisaoPix(),
                  ),
                );
              },
              child: Container(
                
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 236, 9, 0),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: double.maxFinite,
                child: Text(
                  "Enviar Agora",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
