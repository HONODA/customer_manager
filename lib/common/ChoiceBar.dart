import 'package:flutter/material.dart';

class ChoiceBar {
  ChoiceBar({this.title, this.icon, this.widget,this.editingwidget,this.newwidget});
  String title;
  IconData icon;
  Widget widget;
  Widget editingwidget;
  Widget newwidget;
}
