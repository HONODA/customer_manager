import 'package:customor_manager/view/customer/CustomerDetail.dart';
import 'package:customor_manager/viewmodel/Customervm.dart';
import 'package:flutter/material.dart';

///客户界面,显示所有客户
// ignore: must_be_immutable
class Customerv extends StatelessWidget {
  final Customervm customervm = Customervm();
  List<String> customerlist;
  Customerv() {
    getCustomerlist();
  }
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: customerlist.length,
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
                        //new Image.network(
                        //  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597061650862&di=73cad2c236afefc95935b6dfacbd9b2e&imgtype=0&src=http%3A%2F%2Fa1.att.hudong.com%2F62%2F02%2F01300542526392139955025309984.jpg',
                        //  height: 100,
                        //  scale: 2,
                        //),
                        FutureBuilder(
                            future: loadingCustomDetail(index),
                            builder: (context, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.none:
                                  return new Text(
                                      'Press button to start'); //如果_calculation未执行则提示：请点击开始
                                case ConnectionState.waiting:
                                  return new CircularProgressIndicator(
                                    strokeWidth: 4.0,
                                    backgroundColor: Colors.blue,
                                    // value: 0.2,
                                    valueColor:
                                        new AlwaysStoppedAnimation<Color>(
                                            Colors.red),
                                  ); //如果_calculation正在执行则提示：加载中
                                default: //如果_calculation执行完毕
                                  if (snapshot.hasError) //若_calculation执行出现异常
                                    return new Text('Error: ${snapshot.error}');
                                  else //若_calculation执行正常完成
                                    return snapshot.data;
                              }
                            }),
                        //new Text(
                        //  "${items[index]}",
                        //  textScaleFactor: 2,
                        //)
                      ])));
        });
  }

  void getCustomerlist() async {
    customerlist = Customervm().showCutomerList();
  }

  Future<Widget> loadingCustomDetail(int index) async {
    return new CutomerDetail(index);
  }
}
