import 'package:flutter/material.dart';
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
            appBar: AppBar(
              title: Image(
                image: AssetImage("assets/img/white-logo.png"),
                fit: BoxFit.cover,
                height: 50,
              ),
              centerTitle: true,
              backgroundColor: Colors.orange[500],
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: CircleAvatar(
                      radius: 14,
                      child: ClipOval(
                          child: Image.asset("assets/img/person.png"))),
                )
              ],
            ),
            body: Padding(
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
                  ],
                ))));
  }
}
