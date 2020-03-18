import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'cart_page.dart';
import 'models/books.dart';

String imgURL = 'https://hikke.xyz/bookstore/images/';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {

    void _navigationInfoCart(context, Books books) {
    if (kIsWeb) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CartPage(),
            settings: RouteSettings(
              arguments: books,
            ),
          ));
    } else if (Platform.isIOS) {
      Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => CartPage(),
            settings: RouteSettings(
              arguments: books,
            ),
          ));
    } else if (Platform.isAndroid) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CartPage(),
            settings: RouteSettings(
              arguments: books,
            ),
          ));
    }
  }
  
    final Books books = ModalRoute.of(context).settings.arguments;

    return Material(
      child: CupertinoPageScaffold(
          backgroundColor: Colors.white,
          navigationBar: CupertinoNavigationBar(
            backgroundColor: Colors.orange,
            leading: CupertinoNavigationBarBackButton(
              color: Colors.white,
              previousPageTitle: "Início",
              onPressed: () => Navigator.of(context).pop(),
            ),
            middle: Image(
              image: AssetImage("assets/img/white-logo.png"),
            ),
          ),
          child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Container(
                            child: Image(
                              image: NetworkImage(
                                  imgURL + books.imagem),
                            ),
                            width: MediaQuery.of(context).size.width - 200),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  child: Flexible(
                                      child: Text(
                                          books.titulo,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.w600)))),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  child: Flexible(
                                      child: Text("Autor(es): " + books.autor,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16.0)))),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  child: Flexible(
                                      child: Text("Em estoque: " + books.estoque +  " unidade(s)",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14.0)))),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  child: Flexible(
                                      child: Text("R\$" + books.preco,
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w500)))),
                            ],
                          )),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
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
                                      child: Text("Adicionar item ao Carrinho",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: MediaQuery.of(context).size.width / 20)))
                                ],
                              ),
                              highlightElevation: 1,
                              onPressed: () {
                                _navigationInfoCart(context, books);
                              },
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40)
                      )
                    ],
                  )))),
    );
  }
}
