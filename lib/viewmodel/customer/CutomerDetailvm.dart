import 'package:customor_manager/common/MyExpandsionBean.dart';
import 'package:customor_manager/common/ViewModel.dart';
import 'package:flutter/material.dart';

class CustomerDetailvm extends ViewModel {
  //显示客户列表
  MyExpandsionBean showCutomerList(int id) {
    return MyExpandsionBean(id, id.toString(), false);
  }

  //显示对应客户列表
  List<String> showCutomerDetailList(int id) {
    return new List<String>.generate(10, (i) => "Item $i");
  }
}
