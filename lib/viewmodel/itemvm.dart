import 'package:flutter/material.dart';

class Itemvm with ChangeNotifier {
  //显示资料列表
  List<String> showItemList() {
    return new List<String>.generate(100, (i) => "Item $i");
  }
}
