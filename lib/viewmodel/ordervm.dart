import 'package:flutter/material.dart';

class Ordervm with ChangeNotifier {
  //显示订单列表
  List<String> showOrderList() {
    return new List<String>.generate(10, (i) => "Item $i");
  }
}
