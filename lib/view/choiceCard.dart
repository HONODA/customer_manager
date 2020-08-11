import 'package:customor_manager/common/ChoiceBar.dart';
import 'package:flutter/material.dart';

///tabbar选项卡内容
// ignore: must_be_immutable
class ChoiceCard extends StatelessWidget {
  ChoiceCard({Key key, this.choiceBar}) : super(key: key);
  ChoiceBar choiceBar;
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.headline4;

    Stack stack = new Stack(alignment: AlignmentDirectional(0, 0),
        //fit: StackFit.loose,
        children: <Widget>[
          new Card(
              color: Colors.white, //Color.fromARGB(100, 240, 230, 140),
              child: new Center(
                  child: new Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Icon(choiceBar.icon, size: 128.0, color: textStyle.color),
                  new Text(choiceBar.title, style: textStyle),
                ],
              ))),
          choiceBar.widget

          ///从选项卡中获取各自的wideget组件,初始化和 viewmodel对象在[mainvm.dart]
        ]);

    return stack; //使用statck widget 可以使child下的所有组件依次从底层到顶层显示内容，有叠层效果
  }
}
