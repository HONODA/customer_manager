import 'package:flutter/material.dart';
import 'package:customor_manager/viewmodel/customer/CutomerDetailvm.dart';
import 'package:customor_manager/common/MyExpandsionBean.dart';

//显示客户明细
// ignore: must_be_immutable
class CutomerDetail extends StatefulWidget {
  int id = -1;
  CutomerDetail(this.id);
  _CutomerDetail createState() => _CutomerDetail(id);
}

class _CutomerDetail extends State<CutomerDetail> {
  bool loading;
  int _id = -1;
  MyExpandsionBean expandState; //开展开的状态列表,ExpandStateBean是自定义的类

  _CutomerDetail(int id) {
    _id = id;
    expandState = CustomerDetailvm().showCutomerList(_id);
  }
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
        expansionCallback: (index, bol) {
          setState(() {
            expandState.isOpen = !expandState.isOpen;
          });
        },
        children: [
          ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                String name = expandState.value;
                return ListTile(
                  title: Text('公司名称:$name'),
                );
              },
              body: new Column(
                children: [
                  FutureBuilder(
                      future: showCutomerinf(1),
                      builder: (context, snapshot) {
                        if (!expandState.isOpen) return Text('');
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return new Text(
                                'Press button to start'); //如果_calculation未执行则提示：请点击开始
                          case ConnectionState.waiting:
                            return new Text(
                                'Awaiting result...'); //如果_calculation正在执行则提示：加载中
                          default: //如果_calculation执行完毕
                            if (snapshot.hasError) //若_calculation执行出现异常
                              return new Text('Error: ${snapshot.error}');
                            else //若_calculation执行正常完成
                              return snapshot.data;
                        }
                      }),
                  showbutton(expandState.isOpen)
                ], //显示客户详细信息
              ),
              isExpanded: expandState.isOpen)
        ]);
  }

  ///根据id显示客户档案信息明细
  Future<Widget> showCutomerinf(int id) async {
    List<String> items = CustomerDetailvm().showCutomerDetailList(id);
    return new AnimatedList(
        itemBuilder:
            (BuildContext context, int index, Animation<double> animation) {
          String item = items[index];
          return Dismissible(
            key: Key(item),
            child: ListTile(
              title: Text('内容'),
            ),
          );
        },
        initialItemCount: items.length,
        shrinkWrap: true);
  }

  Widget showbutton(bool i) {
    return i
        ? new MaterialButton(child: Text('新增明细'), onPressed: () {})
        : Text('');
  }
}
