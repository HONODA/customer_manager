import 'package:customer_manager/common/CustomerS.dart';
import 'package:customer_manager/common/ViewModel.dart';
import 'package:flutter/material.dart';

class Customervm extends ViewModel {
  //显示客户列表
  List<CustomerS> customerlist;
  int showCutomerListState = 0;
  void showCutomerList() {
    showCutomerListState = 0;
    Future.delayed(Duration(seconds: 1)).then((value) {
      customerlist = new List<CustomerS>.generate(
          10, (i) => CustomerS(i, '客户$i', null, null, 1));
      showCutomerListState = 1;
      notifyListeners();
    });
  }
}
