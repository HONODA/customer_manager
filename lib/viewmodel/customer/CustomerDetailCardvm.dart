import 'package:customor_manager/common/ChoiceBar.dart';
import 'package:flutter/material.dart';

class CustomerDetailCardvm with ChangeNotifier {
  //显示客户列表
  List<ChoiceBar> showCutomerDetailList() {
    return <ChoiceBar>[
      ChoiceBar(title: '订单'),
      ChoiceBar(title: '看板'),
      ChoiceBar(title: '客户'),
      ChoiceBar(title: '资料'),
      ChoiceBar(title: '设置'),
    ];
  }
}
