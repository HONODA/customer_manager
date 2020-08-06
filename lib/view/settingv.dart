import 'package:customor_manager/viewmodel/settingvm.dart';
import 'package:flutter/material.dart';

///设置界面
class Settingv extends StatelessWidget {
  final Settingvm settingvm = Settingvm();
  @override
  Widget build(BuildContext context) {
    var items = settingvm.showSettingList();
    final size = MediaQuery.of(context).size; //组件大小

    return new ListView.builder(
        itemCount: settingvm.showSettingList().length,
        itemBuilder: (context, index) {
          return new SizedBox(
              height: 80,
              child: new Card(
                  color: Colors.grey,
                  child: new Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          "${items[index].title}",
                          textScaleFactor: 1.5,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        new SizedBox(
                          width: size.width / 1.5,
                        ),
                        //new Text("${items[index].tips}"),
                        items[index].widget
                      ])));
        });
  }
}
