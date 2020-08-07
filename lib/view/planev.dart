import 'package:customor_manager/viewmodel/planevm.dart';
import 'package:flutter/material.dart';

///看板内容
class Planev extends StatelessWidget {
  final Planevm planevm = Planevm();
  @override
  Widget build(BuildContext context) {
    var items = planevm.showPlaneList();
    return new ListView.builder(
        itemCount: planevm.showPlaneList().length,
        itemBuilder: (context, index) {
          return new SizedBox(
              height: 80,
              child: new Card(
                  color: Colors.white,
                  child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          "${items[index]}",
                          textScaleFactor: 2,
                        )
                      ])));
        });
  }
}
