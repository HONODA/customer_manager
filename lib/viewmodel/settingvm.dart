import 'package:customor_manager/common/myDropDown.dart';
import 'package:flutter/material.dart';
import 'package:customor_manager/common/SettingTable.dart';
import 'package:customor_manager/common/mySlider.dart';

class Settingvm with ChangeNotifier {
  double value = 0;
  List<SettingTable> settingtable = [
    new SettingTable(
        title: '主题',
        tips: '改变界面主题',
        widget: MyDropDown(items: <String>['深色', '浅色', '跟随系统'])),
    new SettingTable(title: '字体大小', tips: '将界面大小设置成希望的样子', widget: MySlider()),

  ];

  //显示设置列表
  List<SettingTable> showSettingList() {
    //return new List<String>.generate(10, (i) => "Item $i");
    return settingtable;
  }

  //获取目前系统设置的主题
  Brightness getAppTheme() {
    return Brightness.light;
  }

  ///过滤器，JSON 通过 过滤 转化成 [SettingTable]
  SettingTable flitter() {
    return null;
  }
}
