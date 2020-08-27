import 'package:customer_manager/common/CustomerS.dart';
import 'package:customer_manager/common/ViewModel.dart';
import 'package:customer_manager/model/customerm.dart';
import 'package:flutter/material.dart';

class Customervm extends ViewModel {
  //显示客户列表
  Customerm customerm = Customerm();
  List<CustomerS> customerlist;
  int showCutomerListState = 0;
  void showCutomerList() {
    showCutomerListState = 0;
    Future.delayed(Duration(seconds: 0)).then((value) {
      var json = customerm.getCustomerlist("1", "1");

      customerlist = new List<CustomerS>.generate(
          10, (i) => CustomerS(i, '客户$i', null, null, 1));
      showCutomerListState = 1;
      notifyListeners();
    });
  }
}
