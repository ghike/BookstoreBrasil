import 'package:LojaLivros/ui/utils/appBar.dart';
import 'package:LojaLivros/ui/utils/tabBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'utils/carousel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      ClipRRect(
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
                                          padding: EdgeInsets.only(left: 5.0, top: 10.0, bottom: 10.0),
                                          child: Container(
                                            height: 100,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fitHeight,
                                                    image: NetworkImage(
                                                        "https://images-na.ssl-images-amazon.com/images/I/41tc6iwhQUL.jpg"))),
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
                                                      "Clean Agile: Back to Basics",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    subtitle:
                                                        Text("Robert C. Martin"),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(right: 10.0, top: 10.0, bottom: 10.0),
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      child: Text("R\$174.90",
                                                          style: TextStyle(
                                                              fontSize: 18.0,
                                                              color:
                                                                  Colors.red,
                                                                  fontWeight: FontWeight.w600)),)
                                                ],
                                              ),
                                            )),
                                      ],
                                    )))),
                      ),
                                           Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      ClipRRect(
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
                                          padding: EdgeInsets.only(left: 5.0, top: 10.0, bottom: 10.0),
                                          child: Container(
                                            alignment: Alignment.topLeft,
                                            height: 100,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fitHeight,
                                                    image: NetworkImage(
                                                        "https://images-na.ssl-images-amazon.com/images/I/41WH7HFsbzL.jpg"))),
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
                                                      "O Programador Pragmático: De Aprendiz a Mestre",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    subtitle:
                                                        Text("Andrew Hunt, David Thomas"),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(right: 10.0, top: 10.0, bottom: 10.0),
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      child: Text("R\$125.50",
                                                          style: TextStyle(
                                                              fontSize: 18.0,
                                                              color:
                                                                  Colors.red,
                                                                  fontWeight: FontWeight.w600)),)
                                                ],
                                              ),
                                            )),
                                      ],
                                    )))),
                      ),
                                                                 Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      ClipRRect(
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
                                          padding: EdgeInsets.only(left: 5.0, top: 10.0, bottom: 10.0),
                                          child: Container(
                                            alignment: Alignment.topLeft,
                                            height: 100,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fitHeight,
                                                    image: NetworkImage(
                                                        "https://images-na.ssl-images-amazon.com/images/I/51J1VwsSv1L._SX334_BO1,204,203,200_.jpg"))),
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
                                                      "The Mythical Man-Month: Essays on Software Engineering",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    subtitle:
                                                        Text("Frederick P. Brooks Jr."),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(right: 10.0, top: 10.0, bottom: 10.0),
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      child: Text("R\$170.19",
                                                          style: TextStyle(
                                                              fontSize: 18.0,
                                                              color:
                                                                  Colors.red,
                                                                  fontWeight: FontWeight.w600)),)
                                                ],
                                              ),
                                            )),
                                      ],
                                    )))),
                      ),
                    ],
                  )),
            )));
  }
}