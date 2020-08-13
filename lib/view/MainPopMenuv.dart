import 'package:customor_manager/common/ChoiceBar.dart';
import 'package:customor_manager/viewmodel/mainvm.dart';
import 'package:flutter/material.dart';
import 'package:customor_manager/common/pool.dart';

class MainPopMenuv extends StatefulWidget {
  MainPopMenuv();
  _MainPopMenuv createState() => _MainPopMenuv();
}

class _MainPopMenuv extends State<MainPopMenuv> {
  _MainPopMenuv();
  List<ChoiceBar> mList = Mainvm().showTabBar(); //组成一个int类型数组，用来控制索引
  // List<MyExpandsionBean> expandStateList; //开展开的状态列表,ExpandStateBean是自定义的类

  //构造方法，调用这个类的时候自动执行
  @override
  Widget build(BuildContext context) {
    return new PopupMenuButton<int>(
        tooltip: '选项',
        //这是点击弹出菜单的操作，点击对应菜单后，改变屏幕中间文本状态，将点击的菜单值赋予屏幕中间文本
        onSelected: (int value) {
          setState(() {
            //_bodyText = value;
            switch(value){
              case 0 :///在增加界面
              if (pool.currentChoiceInt != null && mList[pool.currentChoiceInt].newwidget!=null)
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) {
                    return mList[pool.currentChoiceInt].newwidget;
                }));
              else
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('无显示的界面'),
                    ));

                break;
              default:
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('打开到奇怪的界面'),
                    ));
            }
;
          });
        },
        //这是弹出菜单的建立，包含了两个子项，分别是增加和删除以及他们对应的值
        itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              PopupMenuItem(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[new Text('增加'), new Icon(Icons.add)],
                ),
                value: 0,
              ),
              PopupMenuItem(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Text('修改'),
                    new Icon(Icons.rate_review)
                  ],
                ),
                value: 1,
              ),
              PopupMenuItem(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[new Text('删除'), new Icon(Icons.remove)],
                ),
                value: 2,
              )
            ]);
  }
}
