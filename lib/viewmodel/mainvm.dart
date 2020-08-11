import 'package:customor_manager/view/customer/Customerv.dart';
import 'package:customor_manager/view/Itemv.dart';
import 'package:customor_manager/view/Orderv.dart';
import 'package:customor_manager/view/Planev.dart';
import 'package:customor_manager/view/Settingv.dart';
import 'package:flutter/material.dart';
// import 'package:rxdart/rxdart.dart'; 如果需要，自行添加插件

import 'package:customor_manager/model/mainm.dart';
import 'package:customor_manager/common/ChoiceBar.dart';

/// with ChangeNotifier : 通过 notifyListeners() 函数，可以通知本对象数据的正在使用者们。
/// 如 state 变量，在改变后调用 notifyListeners(), UI根据值重新构建登录按钮显示内容
class Mainvm with ChangeNotifier {
  final _model = Mainm();
  int state = 0; // 0 未请求，1 正在请求， 2 请求成功， 3请求失败
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  login() {
    final data = {
      "username": usernameController.text,
      "password": passwordController.text,
    };

    /// 不为 0 说明上一条请求未完成，直接退出
    if (state != 0) return;

    /// 开始请求，state 赋值为 1， 并通知监听者
    /// 如果用rxDart插件，可作为doOnListen参数的函数体
    state = 1;
    notifyListeners();

    _model.login(data).listen((v) {
      if (v != 0) {
        /// 返回值不为0，请求失败
        state = 3;
        notifyListeners();
        Future.delayed(Duration(seconds: 1), () {
          state = 0;
          notifyListeners();
        });
      } else {
        /// 返回值为0，请求成功
        state = 2;
        notifyListeners();
        Future.delayed(Duration(seconds: 1), () {
          state = 0;
          notifyListeners();
        });
      }
    });
  }

//显示主界面TabBar
  List<ChoiceBar> showTabBar() {
    return <ChoiceBar>[
      ChoiceBar(title: '订单', icon: Icons.assignment, widget: new Orderv()),
      ChoiceBar(title: '看板', icon: Icons.tv, widget: new Planev()),
      ChoiceBar(title: '客户', icon: Icons.person, widget: new Customerv()),
      ChoiceBar(title: '资料', icon: Icons.border_color, widget: new Itemv()),
      ChoiceBar(title: '设置', icon: Icons.settings, widget: new Settingv()),
    ];
  }
}
