import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'models/books.dart';
import 'utils/appBar.dart';
import 'utils/tabBar.dart';
import 'utils/carousel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isloading = false;
  int total;
  bool refresh = false;
  @override

  var url = "https://hikke.xyz/bookstore/livros.php";
  String imgURL = 'https://hikke.xyz/bookstore/images/';
  List<Books> listBooks = new List<Books>();
  List<Books> showBooks = new List<Books>();

  Future<String> _getBooks() async {
    await Future.delayed(Duration(seconds: 1));
    if (refresh == false) {
      refresh = true;
      API.getTotal().then((response) {
        if (response.statusCode == 200) {
          setState(() {
            final parsed = json.decode(response.body)[0];
            total = parsed['Total'];
          });
        }
      },
          API.getBooks().then((response) {
            if (response.statusCode == 200) {
              setState(() {
                Iterable list = json.decode(response.body);
                listBooks = list.map((model) => Books.fromJson(model)).toList();
                showBooks = listBooks;
              });
            }
          }));
    }
  }

  void initState(){
    super.initState();
    _getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            appBar: BSAppBar(),
            bottomNavigationBar: BSTabBar(),
            body: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("EM DESTAQUE",
                          style: TextStyle(
                              fontFamily: "Open Sans",
                              letterSpacing: 1.0,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.left),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: CarouselHomeSlider(),
                      ),
                      Text("OUTROS PRODUTOS",
                          style: TextStyle(
                              fontFamily: "Open Sans",
                              letterSpacing: 1.0,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.left),
                      Column(
                        children: showBooks.map((it) {
                          return Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                clipBehavior: Clip.hardEdge,
                                child: Card(
                                    elevation: 2,
                                    child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                            child: Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 5.0,
                                                  top: 10.0,
                                                  bottom: 10.0),
                                              child: Container(
                                                height: 100,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.fitHeight,
                                                        image: NetworkImage(
                                                            imgURL +
                                                                it.imagem))),
                                              ),
                                            ),
                                            Container(
                                                alignment: Alignment.topCenter,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    125,
                                                child: Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 10),
                                                  child: Column(
                                                    children: <Widget>[
                                                      ListTile(
                                                        title: Text(
                                                          it.titulo,
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                        subtitle:
                                                            Text(it.autor),
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 10.0,
                                                                top: 10.0,
                                                                bottom: 10.0),
                                                        alignment: Alignment
                                                            .bottomRight,
                                                        child: Text(
                                                            "R\$" + it.preco,
                                                            style: TextStyle(
                                                                fontSize: 18.0,
                                                                color:
                                                                    Colors.red,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
                                                      )
                                                    ],
                                                  ),
                                                )),
                                          ],
                                        )))),
                              ));
                        }).toList(),
                      ),
                    ],
                  )),
            )));
  }
}
