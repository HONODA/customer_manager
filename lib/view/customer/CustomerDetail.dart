import 'package:flutter/material.dart';

import 'package:customor_manager/common/MyExpandsionBean.dart';

class CutomerDetail extends StatefulWidget {
  _CutomerDetail createState() => _CutomerDetail();
}

class _CutomerDetail extends State<CutomerDetail> {
  List<int> mList; //组成一个int类型数组，用来控制索引
  List<MyExpandsionBean> expandStateList; //开展开的状态列表,ExpandStateBean是自定义的类

  //构造方法，调用这个类的时候自动执行
  _CutomerDetail() {
    mList = new List();
    expandStateList = new List();
    //遍历两个List进行赋值
    for (int i = 0; i < 1; i++) {
      mList.add(i);
      expandStateList.add(MyExpandsionBean(i, false)); //item初始状态为闭着的
    }
  }

  //修改展开与闭合的内部方法
  _setCurrentIndex(int index, isExpand) {
    setState(() {
      //遍历可展开状态列表
      expandStateList.forEach((item) {
        if (item.index == index) {
          //取反，经典取反方法
          item.isOpen = !isExpand;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      //交互回调属性，里面是个匿名函数
      expansionCallback: (index, bol) {
        //调用内部方法
        _setCurrentIndex(index, bol);
      },
      //进行map操作，然后用toList再次组成List
      children: mList.map((index) {
        //返回一个组成的ExpansionPanel
        return ExpansionPanel(
            headerBuilder: (context, isExpanded) {
              return ListTile(
                title: Text('公司名称:$index'),
              );
            },
            body: new Column(
              children: [
                //new TextField(
                //  decoration: InputDecoration(labelText: '账号'),
                //)
              ], //显示客户详细信息
            ),
            isExpanded: expandStateList[index].isOpen);
      }).toList(),
    );
  }
}
