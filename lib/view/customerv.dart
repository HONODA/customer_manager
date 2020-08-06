import 'package:customor_manager/viewmodel/customervm.dart';
import 'package:flutter/material.dart';

///客户界面
class Customerv extends StatelessWidget {
  final Customervm customervm = Customervm();
  @override
  Widget build(BuildContext context) {
    var items = customervm.showCutomerList();
    return new ListView.builder(
        itemCount: customervm.showCutomerList().length,
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
