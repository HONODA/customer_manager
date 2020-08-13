import 'package:flutter/material.dart';

class Customervm with ChangeNotifier {
  //显示客户列表
  List<String> showCutomerList() {
    //sleep(Duration(seconds: 1));
    return new List<String>.generate(10, (i) => "Item $i");
  }
}
