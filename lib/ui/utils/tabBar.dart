import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BSTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(
        backgroundColor: Colors.white,
        activeColor: Colors.amber[800],
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), title: Text("Início")),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.shopping_cart),
              title: Text("Carrinho")),
        ]);
  }
}
