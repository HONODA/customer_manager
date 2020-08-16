import 'package:customor_manager/common/ViewModel.dart';
import 'package:flutter/material.dart';

class Customervm extends ViewModel {
  //显示客户列表
  List<String> showCutomerList() {
    //sleep(Duration(seconds: 1));
    return new List<String>.generate(100, (i) => "Item $i");
  }
}
