import 'dart:convert';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'models/books.dart';
import 'utils/loadingHome.dart';
import 'product_page.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  var isloading = false;
  int total;
  bool refresh = false;
  @override
  var url = "https://hikke.xyz/bookstore/livros.php";
  String imgURL = 'https://hikke.xyz/bookstore/images/';
  List<Books> listBooks = new List<Books>();
  List<Books> listDestaqueBooks = new List<Books>();
  List<Books> sliderDestaqueBooks = new List<Books>();
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
          API.getBooks().then(
            (response) {
              if (response.statusCode == 200) {
                setState(() {
                  Iterable list = json.decode(response.body);
                  listBooks =
                      list.map((model) => Books.fromJson(model)).toList();
                  showBooks = listBooks;
                });
              }
            },
          ),
          API.getDestaque().then((response) {
            if (response.statusCode == 200) {
              setState(() {
                Iterable listD = json.decode(response.body);
                listDestaqueBooks =
                    listD.map((model) => Books.fromJson(model)).toList();
                sliderDestaqueBooks = listDestaqueBooks;
              });
            }
          }));
    }
  }

  void _navigationProductPage(context, Books books) {
    if (kIsWeb) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(),
            settings: RouteSettings(
              arguments: books,
            ),
          ));
    } else if (Platform.isIOS) {
      Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => ProductPage(),
            settings: RouteSettings(
              arguments: books,
            ),
          ));
    } else if (Platform.isAndroid) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(),
            settings: RouteSettings(
              arguments: books,
            ),
          ));
    }
  }

  void _navigationCartPage() {
    if (kIsWeb) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CartPage(),
          ));
    } else if (Platform.isIOS) {
      Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => CartPage(),
          ));
    } else if (Platform.isAndroid) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CartPage(),
          ));
    }
  }

  Widget loadedHome(BuildContext context) {
    return Material(
        child: CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.orange,
        middle: Image(
          image: AssetImage("assets/img/white-logo.png"),
        ),
        trailing: GestureDetector(
          child: Icon(CupertinoIcons.shopping_cart, color: Colors.white),
          onTap: () {
            _navigationCartPage();
          },
        ),
      ),
      child: SingleChildScrollView(
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
                  child: CarouselSlider(
                    height: 350.0,
                    initialPage: 0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    reverse: false,
                    enableInfiniteScroll: true,
                    autoPlayInterval: Duration(seconds: 4),
                    autoPlayAnimationDuration: Duration(milliseconds: 1000),
                    pauseAutoPlayOnTouch: Duration(seconds: 10),
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index) {
                      setState(() {
                        _current = index;
                      });
                    },
                    items: sliderDestaqueBooks.map((it) {
                      return Builder(
                        builder: (BuildContext context) {
                          return GestureDetector(
                              child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                            ),
                            child: Image.network(
                              imgURL + it.imagem,
                              fit: BoxFit.fill,
                            ),
                          ),
                          onTap: (){
                            _navigationProductPage(context, it);
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
                Text("OUTROS PRODUTOS",
                    style: TextStyle(
                      fontFamily: "Open Sans",
                      letterSpacing: 1.0,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
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
                                  onTap: () {
                                    _navigationProductPage(context, it);
                                  },
                                  child: Container(
                                      child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 5.0, top: 10.0, bottom: 10.0),
                                        child: Container(
                                          height: 100,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fitHeight,
                                                  image: NetworkImage(
                                                      imgURL + it.imagem))),
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.topCenter,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              125,
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Column(
                                              children: <Widget>[
                                                ListTile(
                                                  title: Text(
                                                    it.titulo,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                  subtitle: Text(it.autor),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      right: 10.0,
                                                      top: 10.0,
                                                      bottom: 10.0),
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: Text("R\$" + it.preco,
                                                      style: TextStyle(
                                                          fontSize: 18.0,
                                                          color: Colors.red,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                )
                                              ],
                                            ),
                                          )),
                                    ],
                                  )))),
                        ));
                  }).toList(),
                ),
                Padding(padding: EdgeInsets.only(top: 84))
              ],
            )),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: CupertinoPageScaffold(
            child: CupertinoTabScaffold(
                tabBar: CupertinoTabBar(
                  backgroundColor: Color.fromARGB(220, 255, 255, 255),
                  activeColor: Colors.amber[800],
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.home), title: Text("Início")),
                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.person_solid),
                        title: Text("Sua Conta")),
                  ],
                ),
                tabBuilder: (BuildContext context, int index) {
                  assert(index >= 0 && index <= 1);
                  switch (index) {
                    case 0:
                      return CupertinoTabView(builder: (context) {
                        return FutureBuilder(
                            future: _getBooks(),
                            builder: (BuildContext context,
                                AsyncSnapshot<String> snapshot) {
                              Widget children;

                              if (listBooks.length < 1) {
                                children = loadingHome(context);
                              } else {
                                children = loadedHome(context);
                              }
                              return children;
                            });
                      });
                    case 1:
                      return null;
                  }
                })));
  }
}
