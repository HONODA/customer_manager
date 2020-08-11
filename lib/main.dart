import 'package:customor_manager/common/ChoiceBar.dart';
import 'package:customor_manager/view/ChoiceCard.dart';
import 'package:customor_manager/view/MainPopMenuv.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:customor_manager/viewmodel/Mainvm.dart';
import 'package:customor_manager/viewmodel/Settingvm.dart';

void main() => runApp(MyApp());

///主界面展示
//显示tabbar  如客户、订单、看板、资料、选项卡内容。
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter mvvm Demo',
      theme: ThemeData(
        brightness: Settingvm().getAppTheme(),
        primarySwatch: Colors.orange,
      ),

      /// [ChangeNotifierProvider]。所有的viewModel通过 Provider 实现与view 层的绑定。
      /// Provider 是对 [InheritedWidget] 封装。因此我们才能实现调用notifyListeners() 时，通知子树重新构建
      /// 当然你也可以一个插件也不用，自己封装[InheritedWidget]
      home: ChangeNotifierProvider(
          create: (_) => Mainvm(),
          child: new DefaultTabController(
            length: Mainvm().showTabBar().length,
            child: new Scaffold(
              appBar: new AppBar(
                title: Text('CAOM'), //主界面标题名称
                centerTitle: true,
                bottom: new TabBar(
                    tabs: Mainvm().showTabBar().map((ChoiceBar b) {
                  return Tab(text: b.title, icon: new Icon(b.icon));
                }).toList()),

                ///将tabbar中图片和文字显示出来，viewmodel对象为 [Mainvm]
              ),
              body: new TabBarView(
                  physics:
                      new NeverScrollableScrollPhysics(), //TabBarView不允许左右滑块
                  children: Mainvm().showTabBar().map((ChoiceBar b) {
                    return new Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: new ChoiceCard(choiceBar: b),
                    );
                  }).toList()),
              bottomNavigationBar: new BottomAppBar(
                elevation: 10.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new IconButton(
                      icon: new Icon(Icons.search),
                      onPressed: () {},
                    ),
                    new MainPopMenuv(),
                  ],
                ),
              ),

              ///此处主界面下面显示卡片内容viewmodel对象为[Mainvm],
            ),
          )),
      debugShowCheckedModeBanner: false, //取消debug模式
    );
  }
}
