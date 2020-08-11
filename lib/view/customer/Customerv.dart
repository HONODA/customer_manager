import 'package:customor_manager/view/customer/CustomerDetail.dart';
import 'package:customor_manager/viewmodel/Customervm.dart';
import 'package:flutter/material.dart';

///客户界面
class Customerv extends StatelessWidget {
  final Customervm customervm = Customervm();
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: customervm.showCutomerList().length,
        itemBuilder: (context, index) {
          return new SizedBox(
              //height: 200,
              child: new Card(
                  color: Colors.white,
                  child: new Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Image.network(
                          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597061650862&di=73cad2c236afefc95935b6dfacbd9b2e&imgtype=0&src=http%3A%2F%2Fa1.att.hudong.com%2F62%2F02%2F01300542526392139955025309984.jpg',
                          height: 100,
                          scale: 2,
                        ),
                        new CutomerDetail(),
                        //new Text(
                        //  "${items[index]}",
                        //  textScaleFactor: 2,
                        //)
                      ])));
        });
  }
}
