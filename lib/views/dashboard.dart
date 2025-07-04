import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool cardAberto = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: cardAberto
                ? MediaQuery.of(context).size.height * 0.50
                : MediaQuery.of(context).size.height * 0.36,
            child: Stack(
              children: [
                Image.asset("fundo_dashboard.png"),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "teste3.png",
                        width: 150,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.search_outlined,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.message_outlined,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.notifications_outlined,
                            color: Colors.white,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 145,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Olá, Guilherme",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        Text(
                          "Ag 4317 Cc 014578-9",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.26,
                  child: Padding(
                    padding: EdgeInsets.only(left: 12, right: 12),
                    child: Card(
                      elevation: 10,
                      color: Colors.white,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        width: MediaQuery.of(context).size.width * 0.93,
                        height: cardAberto ? null : null,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.monetization_on_outlined,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Saldo disponivel",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      cardAberto = !cardAberto;
                                    });
                                  },
                                  icon: cardAberto
                                      ? Icon(
                                          Icons.keyboard_arrow_up,
                                          size: 30,
                                        )
                                      : Icon(
                                          Icons.keyboard_arrow_down,
                                          size: 30,
                                        ),
                                )
                              ],
                            ),
                            cardAberto
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "R\$ 10.000.000,00",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        "Saldo + Limite: 143,00",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        "Entenda seu limite",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 16,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Ver extrato",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
