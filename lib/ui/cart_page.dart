import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

int qtd = 1;
double price = 10.00;
double newprice = price * qtd;

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void addProduct() {
    setState(() {
      qtd++;
      newprice = price * qtd;
    });
  }

  void removeProduct() {
    setState(() {
      if (qtd != 1) {
        qtd--;
        newprice = price * qtd;
      }
    });
  }

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
                              width: MediaQuery.of(context).size.width - 140,
                              child: Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Column(
                                  children: <Widget>[
                                    ListTile(
                                      title: Text(
                                        "Clean Architecture: A Craftsman's Guide to Software Structure and Design",
                                        style: TextStyle(fontSize: 13),
                                      ),
                                      subtitle: Text("Robert C. Martin",
                                          style: TextStyle(fontSize: 12)),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 10.0, bottom: 10.0),
                                      alignment: Alignment.bottomRight,
                                    )
                                  ],
                                ),
                              )),
                          Container(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    width: 25,
                                    height: 25,
                                    child: FloatingActionButton(
                                      heroTag: "btnminus",
                                      elevation: 1,
                                      backgroundColor: Colors.orange,
                                      highlightElevation: 2,
                                      onPressed: removeProduct,
                                      child: Text("–",
                                          style:
                                              TextStyle(color: Colors.black)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    child: Text("$qtd"),
                                  ),
                                  Container(
                                    width: 25,
                                    height: 25,
                                    child: FloatingActionButton(
                                      heroTag: "btnplus",
                                      elevation: 1,
                                      backgroundColor: Colors.orange,
                                      highlightElevation: 2,
                                      onPressed: addProduct,
                                      child: Text("+",
                                          style:
                                              TextStyle(color: Colors.black)),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 7),
                                  child: Text("R\$$newprice",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 18.0))),
                            ],
                          )),
                        ],
                      )
                    ])))));
  }
}
