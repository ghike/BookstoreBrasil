import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: CupertinoPageScaffold(
            backgroundColor: Color.fromARGB(255, 255, 227, 128),
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(children: <Widget>[
                  Container(
                      child: Center(
                          child: Stack(
                    children: <Widget>[
                      Container(
                        child: Image(
                            image: AssetImage("assets/img/background.png")),
                      ),
                      Positioned.fill(
                        child: Container(
                            alignment: Alignment.center,
                            child: Image(
                                image: AssetImage("assets/img/logo.png"),
                                width:
                                    MediaQuery.of(context).size.width - 120)),
                      ),
                    ],
                  ))),
                  Container(
                      height: MediaQuery.of(context).size.height * .6,
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(top: 15.0),
                              child: Text("Seja bem-vindo!",
                                  style: TextStyle(
                                      fontFamily: "Open Sans",
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black))),
                          Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Text(
                                "Acesse a sua conta",
                                style: TextStyle(fontSize: 15.0),
                              )),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.0, right: 15.0, left: 15.0),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: "Email",
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.0, right: 15.0, left: 15.0),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: "Senha",
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 20, right: 55.0, left: 55.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25.0),
                                  child: MaterialButton(
                                height: 60,
                                color: Colors.orange[400],
                                highlightColor: Colors.amber,
                                splashColor: Colors.amber,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          143,
                                      child: Center(
                                        child: Text("Entrar",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    20)),
                                      ),
                                    )
                                  ],
                                ),
                                highlightElevation: 1,
                                onPressed: () {},
                              )))
                        ],
                      ))
                ]),
              ),
            )));
  }
}
