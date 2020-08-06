import 'package:customor_manager/viewmodel/ordervm.dart';
import 'package:flutter/material.dart';

///订单用户交互界面
class Orderv extends StatelessWidget {
  final Ordervm ordervm = Ordervm();
  @override
  Widget build(BuildContext context) {
    var items = ordervm.showOrderList();
    return new ListView.builder(
        itemCount: ordervm.showOrderList().length,
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
