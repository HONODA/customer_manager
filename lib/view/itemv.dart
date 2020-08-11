import 'package:customor_manager/viewmodel/Itemvm.dart';
import 'package:flutter/material.dart';

///设置界面
class Itemv extends StatelessWidget {
  final Itemvm itemvm = Itemvm();
  @override
  Widget build(BuildContext context) {
    var items = itemvm.showItemList();
    return new ListView.builder(
        itemCount: itemvm.showItemList().length,
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
