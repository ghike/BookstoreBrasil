import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'ui/home_page.dart';

void main() {
  runApp(MaterialApp(
    title: "Loja de Livros",
    home: _SplashScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class _SplashScreen extends StatefulWidget {
  @override
  __SplashScreenState createState() => __SplashScreenState();
}

class __SplashScreenState extends State<_SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}

Widget _introScreen(){
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 2,
        backgroundColor: Colors.orange,
        loaderColor: Colors.white,
        navigateAfterSeconds: HomePage(),
      ),
      Container(
        child: Center(
          child: Image(
            image: AssetImage("assets/img/white-logo.png"),
            width: 280.0
          )
        )
      )
    ],
  );
}