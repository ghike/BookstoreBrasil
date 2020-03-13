import 'package:flutter/material.dart';

class BSAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
            child: GestureDetector(
              child: CircleAvatar(
                  radius: 14,
                  child: ClipOval(child: Image.asset("assets/img/person.png"))),
              onTap: () {
                print(";");
              },
            )),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
