import 'package:customer_manager/viewmodel/Ordervm.dart';
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
