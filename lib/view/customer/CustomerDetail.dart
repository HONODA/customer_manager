import 'package:customer_manager/common/CustomerS.dart';
import 'package:flutter/material.dart';
import 'package:customer_manager/viewmodel/customer/CutomerDetailvm.dart';
import 'package:customer_manager/common/MyExpandsionBean.dart';
import 'package:provider/provider.dart';

import 'CustomerItemDetail.dart';

//显示客户明细
class CutomerDetail extends StatefulWidget {
  CustomerS customer;
  int id = -1;
  CutomerDetail(this.id, this.customer);
  _CutomerDetail createState() => _CutomerDetail(id, customer);
}

class _CutomerDetail extends State<CutomerDetail> {
  CustomerS _customerS;
  CustomerDetailvm customerDetailvm;
  int _id = -1;
  MyExpandsionBean expandState; //开展开的状态列表,ExpandStateBean是自定义的类

  _CutomerDetail(int id, CustomerS _customers) {
    _id = id;
    _customerS = _customers;
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => CustomerDetailvm())],
        child: Consumer<CustomerDetailvm>(builder: (_, custdevm, w) {
          customerDetailvm = custdevm;
          switch (custdevm.showCustomerListState) {
            case -1:
              return MaterialButton(
                  onPressed: () {
                    custdevm.showCutomerList(_id);
                  },
                  child: Icon(Icons.refresh));
              break;
            case 0:
              custdevm.showCutomerList(_id);
              return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CircularProgressIndicator()]);
              break;
            case 1:
              return showCustomerDetial();
          }
          return Icon(Icons.cancel);
        }));
  }

  Widget showCustomerDetial() {
    expandState = customerDetailvm.showcustomerlistBean;
    return ExpansionPanelList(
        expansionCallback: (index, bol) {
          setState(() {
            expandState.isOpen = !expandState.isOpen;
          });
        },
        children: [
          ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                //String name = expandState.value;
                return ListTile(
                  title: Text('${_customerS.name}'),
                  //trailing: Text('22'),
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
                                '等待结果...'); //如果_calculation正在执行则提示：加载中
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
            direction: DismissDirection.startToEnd,
            background: new Container(
                color: Colors.red,
                padding: EdgeInsets.all(8),
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [Icon(Icons.delete_forever), Text('删除')],
                )),
            key: Key(item),
            child: MaterialButton(
              child: ListTile(
                title: Text('内容'), //详细信息显示内容
                trailing: Icon(Icons.chevron_right),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new CustomerItemDetail()));
              },
            ),
            onDismissed: (diretion) {
              print(diretion);
            },
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
