import 'package:customor_manager/common/ChoiceBar.dart';
import 'package:customor_manager/view/customerv.dart';
import 'package:customor_manager/view/mianv.dart';
import 'package:flutter/material.dart';

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
              color: Colors.black,
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
        ]);

    return stack;
  }
}
