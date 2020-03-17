import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
          backgroundColor: Colors.white,
          navigationBar: CupertinoNavigationBar(
            backgroundColor: Colors.orange,
            leading: CupertinoNavigationBarBackButton(
              color: Colors.white,
              previousPageTitle: "Voltar",
              onPressed: () => Navigator.of(context).pop(),
            ),
            middle: Text(
              "Carrinho",
              style: TextStyle(color: Colors.white),
            ),
          ),
          child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
                  child: Column(children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Produto"),
                        Text("Qtde./Preço")
                      ],
                    ),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 40,
                          width: 30,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: NetworkImage(
                                      "https://hikke.xyz/bookstore/images/51JF95r45vL.jpg"))),
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            width: MediaQuery.of(context).size.width - 125,
                            child: Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    title: Text(
                                      "Clean Architecture: A Craftsman's Guide to Software Structure and Design",
                                      style: TextStyle(
                                          fontSize: 13),
                                    ),
                                    subtitle: Text("Robert C. Martin",
                                    style: TextStyle(
                                      fontSize: 12
                                    )),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 10.0, bottom: 10.0),
                                    alignment: Alignment.bottomRight,
                                    // child: Text("R\$" + it.preco,
                                    //     style: TextStyle(
                                    //         fontSize: 18.0,
                                    //         color: Colors.red,
                                    //         fontWeight:
                                    //             FontWeight.w600)),
                                  )
                                ],
                              ),
                            )),
                            Container(
                              child: Column(children: <Widget>[
                                Text("oi"),
                                Text("Tchau")
                              ],)
                            )
                      ],
                    )
                  ])))),
    );
  }
}
