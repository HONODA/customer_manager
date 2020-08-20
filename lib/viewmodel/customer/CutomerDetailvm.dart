import 'package:customer_manager/common/MyExpandsionBean.dart';
import 'package:customer_manager/common/ViewModel.dart';
import 'package:flutter/material.dart';

class CustomerDetailvm extends ViewModel {
  int showCustomerListState = 0;
  MyExpandsionBean showcustomerlistBean;
  //显示客户列表
  void showCutomerList(int id) {
    Future.delayed(Duration(seconds: 0)).then((value) {
      showcustomerlistBean = MyExpandsionBean(id, id.toString(), false);
      showCustomerListState = 1;
      notifyListeners();
    });
  }

  //显示对应客户列表
  List<String> showCutomerDetailList(int id) {
    return new List<String>.generate(10, (i) => "Item $i");
  }
}
