import 'package:flutter/material.dart';

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
                      child: Image.asset("assets/img/person.png")
                    )
                  ),
                )
              ],
            ),
            body: Container()));
  }
}
