import 'package:flutter/material.dart';

class SettingTable {
  SettingTable({this.title, this.tips, this.widget, this.height});
  String title; //标题，内容，值的名称
  String tips; //提示或者解释内容
  Widget widget; //设置值或者参数组件
  double height; //高度
}
