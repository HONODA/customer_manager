import 'package:customor_manager/view/customer/CustomerDetail.dart';
import 'package:customor_manager/viewmodel/Customervm.dart';
import 'package:flutter/material.dart';

///客户界面,显示所有客户
// ignore: must_be_immutable
class Customerv extends StatefulWidget {
  @override
  _Customerv createState() => _Customerv();
}

class _Customerv extends State<Customerv> {
  @override
  void initState() {
    customerlist = Customervm().showCutomerList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getCustomerlist(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return new Text(
                  'Press button to start'); //如果_calculation未执行则提示：请点击开始
            case ConnectionState.waiting:
              return new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      strokeWidth: 2.0,
                      backgroundColor: Colors.deepOrange,
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.orange),
                    )
                  ]); //如果_calculation正在执行则提示：加载中
            default: //如果_calculation执行完毕
              if (snapshot.hasError) //若_calculation执行出现异常
                return new Text('Error: ${snapshot.error}');
              else //若_calculation执行正常完成
                return snapshot.data;
          }
        });
  }

  final Customervm customervm = Customervm();
  List<String> customerlist;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  Future<Widget> getCustomerlist() async {
    return new AnimatedList(
        key: _listKey,
        initialItemCount: customerlist.length,
        itemBuilder: (context, index, animation) {
          return new SizeTransition(
              sizeFactor: animation,
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
                                  return new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CircularProgressIndicator(
                                          strokeWidth: 2.0,
                                          backgroundColor: Colors.deepOrange,
                                          valueColor:
                                              new AlwaysStoppedAnimation<Color>(
                                                  Colors.orange),
                                        )
                                      ]); //如果_calculation正在执行则提示：加载中
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

  Future<Widget> loadingCustomDetail(int index) async {
    return new CutomerDetail(index);
  }
}
