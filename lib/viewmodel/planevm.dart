import 'package:flutter/material.dart';

class Planevm with ChangeNotifier {
  //显示订单列表
  List<String> showPlaneList() {
    return new List<String>.generate(10, (i) => "Item $i");
  }
}
