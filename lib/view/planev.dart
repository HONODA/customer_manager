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
                  color: Colors.grey,
                  child: new Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          "${items[index]}",
                          textScaleFactor: 2,
                        )
                      ])));
        });
  }
}
