import 'package:flutter/material.dart';
import 'package:customor_manager/common/SettingTable.dart';

class Settingvm with ChangeNotifier {
  //显示设置列表
  List<SettingTable> showSettingList() {
    //return new List<String>.generate(10, (i) => "Item $i");
    return [
      new SettingTable(
          title: '字体大小', tips: '将界面大小设置成希望的样子', widget: new Slider(value: 0))
    ];
  }

  ///过滤器，JSON 通过 过滤 转化成 [SettingTable]
  SettingTable flitter() {
    return null;
  }
}
