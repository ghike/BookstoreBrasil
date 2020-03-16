import 'package:LojaLivros/ui/utils/carousel.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

@override
Widget loadingHome(BuildContext context) {
  return Material(
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
                      child: Shimmer.fromColors(
                          child: Row(
                            children: <Widget>[
                              Container(
                                  alignment: Alignment.center,
                                  width: 50,
                                  height:
                                      MediaQuery.of(context).size.width - 70,
                                  decoration:
                                      BoxDecoration(color: Colors.grey[100])),
                              Padding(padding: EdgeInsets.only(right: 20)),
                              Container(
                                alignment: Alignment.center,
                                height: MediaQuery.of(context).size.width - 20,
                                width: MediaQuery.of(context).size.width - 170,
                                decoration:
                                    BoxDecoration(color: Colors.grey[100]),
                              ),
                              Padding(padding: EdgeInsets.only(right: 20)),
                              Container(
                                  alignment: Alignment.center,
                                  width: 50,
                                  height:
                                      MediaQuery.of(context).size.width - 70,
                                  decoration:
                                      BoxDecoration(color: Colors.grey[100])),
                            ],
                          ),
                          baseColor: Colors.grey[300],
                          highlightColor: Colors.grey[100]),
                    ),
                    Text("OUTROS PRODUTOS",
                        style: TextStyle(
                            fontFamily: "Open Sans",
                            letterSpacing: 1.0,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.left),
                    Column(children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              clipBehavior: Clip.hardEdge,
                              child: Card(
                                  elevation: 2,
                                  child: Container(
                                      child: Row(
                                    children: <Widget>[
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 5.0,
                                              top: 10.0,
                                              bottom: 10.0),
                                          child: Shimmer.fromColors(
                                            baseColor: Colors.grey[300],
                                            highlightColor: Colors.grey[100],
                                            child: Container(
                                              height: 100,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[100],
                                              ),
                                            ),
                                          )),
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
                                                  title: Shimmer.fromColors(
                                                      child: Container(
                                                          height: 15,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Colors
                                                                          .grey[
                                                                      100])),
                                                      baseColor:
                                                          Colors.grey[300],
                                                      highlightColor:
                                                          Colors.grey[100]),
                                                  subtitle: Shimmer.fromColors(
                                                      child: Container(
                                                          height: 10,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Colors
                                                                          .grey[
                                                                      100])),
                                                      baseColor:
                                                          Colors.grey[300],
                                                      highlightColor:
                                                          Colors.grey[100]),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      right: 10.0,
                                                      top: 10.0,
                                                      bottom: 10.0),
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: Shimmer.fromColors(
                                                      child: Container(
                                                          height: 20,
                                                          width: 60,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Colors
                                                                          .grey[
                                                                      100])),
                                                      baseColor:
                                                          Colors.grey[300],
                                                      highlightColor:
                                                          Colors.grey[100]),
                                                )
                                              ],
                                            ),
                                          ))
                                    ],
                                  ))))),
                      Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              clipBehavior: Clip.hardEdge,
                              child: Card(
                                  elevation: 2,
                                  child: Container(
                                      child: Row(
                                    children: <Widget>[
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 5.0,
                                              top: 10.0,
                                              bottom: 10.0),
                                          child: Shimmer.fromColors(
                                            baseColor: Colors.grey[300],
                                            highlightColor: Colors.grey[100],
                                            child: Container(
                                              height: 100,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[100],
                                              ),
                                            ),
                                          )),
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
                                                  title: Shimmer.fromColors(
                                                      child: Container(
                                                          height: 15,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Colors
                                                                          .grey[
                                                                      100])),
                                                      baseColor:
                                                          Colors.grey[300],
                                                      highlightColor:
                                                          Colors.grey[100]),
                                                  subtitle: Shimmer.fromColors(
                                                      child: Container(
                                                          height: 10,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Colors
                                                                          .grey[
                                                                      100])),
                                                      baseColor:
                                                          Colors.grey[300],
                                                      highlightColor:
                                                          Colors.grey[100]),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      right: 10.0,
                                                      top: 10.0,
                                                      bottom: 10.0),
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: Shimmer.fromColors(
                                                      child: Container(
                                                          height: 20,
                                                          width: 60,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Colors
                                                                          .grey[
                                                                      100])),
                                                      baseColor:
                                                          Colors.grey[300],
                                                      highlightColor:
                                                          Colors.grey[100]),
                                                )
                                              ],
                                            ),
                                          ))
                                    ],
                                  )))))
                    ])
                  ]))));
}
