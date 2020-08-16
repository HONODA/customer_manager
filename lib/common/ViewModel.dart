import 'package:flutter/material.dart';

class ViewModel with ChangeNotifier {
  ///状态 -1 错误 0 未开始 1 完成 2 等待
  int state = -1;
}
