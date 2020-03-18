import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'models/books.dart';

int qtd = 1;
int maxqtd = 0;
double newprice = 0;
double showprice = 0;
String imgURL = 'https://hikke.xyz/bookstore/images/';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final Books books = ModalRoute.of(context).settings.arguments;
    double baseprice = double.parse(books.preco);
    newprice = baseprice * qtd;
    showprice = num.parse(newprice.toStringAsFixed(2));
    maxqtd = int.parse(books.estoque);

    Future cartSend() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  backgroundColor: Colors.white,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                      ]),
                    )
                  ]));
        });

      var url = 'https://hikke.xyz/bookstore/carrinho.php';

      var data = {
        'titulo': books.titulo,
        'quantidade': qtd
      };

      var response = await http.post(url, body: json.encode(data));

      var message = jsonDecode(response.body);

      if (response.statusCode == 200) {
        setState(() {
          Navigator.of(context).pop();
        });
      } else
        setState(() {
          Navigator.of(context).pop();
        });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          if (kIsWeb){
            return AlertDialog(
              title: Text(message),
              actions: <Widget>[
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          }
          else if (Platform.isAndroid) {
            return AlertDialog(
              title: Text(message),
              actions: <Widget>[
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          } else if (Platform.isIOS) {
            return CupertinoAlertDialog(
              title: Text(message,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500)  
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("OK", 
                  style: TextStyle(color: Colors.blue)),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          }
        },
      );
    }

    void addProduct() {
      setState(() {
        if (qtd < maxqtd) {
          qtd++;
          newprice = baseprice * qtd;
          showprice = num.parse(newprice.toStringAsFixed(2));
        }
      });
    }

    void removeProduct() {
      setState(() {
        if (qtd != 1) {
          qtd--;
          newprice = baseprice * qtd;
          showprice = num.parse(newprice.toStringAsFixed(2));
        }
      });
    }

    return Material(
        child: CupertinoPageScaffold(
            backgroundColor: Colors.white,
            navigationBar: CupertinoNavigationBar(
              backgroundColor: Colors.orange,
              leading: CupertinoNavigationBarBackButton(
                  color: Colors.white,
                  previousPageTitle: "Voltar",
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
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
                                    image:
                                        NetworkImage(imgURL + books.imagem))),
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
                                        books.titulo,
                                        style: TextStyle(fontSize: 13),
                                      ),
                                      subtitle: Text(books.autor,
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
                                  child: Text("R\$$showprice",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 15.5))),
                            ],
                          )),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 150.0),
                        child: Container(
                            height: 50.0,
                            width: MediaQuery.of(context).size.width,
                            child: MaterialButton(
                              color: Colors.orange[400],
                              highlightColor: Colors.amber,
                              splashColor: Colors.amber,
                              child: Row(
                                children: <Widget>[
                                  Icon(CupertinoIcons.shopping_cart,
                                      color: Colors.white),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: VerticalDivider(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                      alignment: Alignment.center,
                                      child: Text("Finalizar Pedido",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: MediaQuery.of(context).size.width / 20)))
                                ],
                              ),
                              highlightElevation: 1,
                              onPressed: () {
                                cartSend();
                              },
                            )),
                      ),
                    ])))));
  }
}
