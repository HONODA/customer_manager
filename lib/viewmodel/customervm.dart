import 'package:flutter/material.dart';

class Customervm with ChangeNotifier {
  //显示客户列表
  List<String> showCutomerList() {
    return new List<String>.generate(100, (i) => "Item $i");
  }
}
