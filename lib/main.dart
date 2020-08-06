import 'package:customor_manager/common/ChoiceBar.dart';
import 'package:customor_manager/view/choiceCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:customor_manager/viewmodel/mainvm.dart';
import 'package:customor_manager/view/mianv.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter mvvm Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
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
                title: Text('CAOM'),
                bottom: new TabBar(
                    tabs: Mainvm().showTabBar().map((ChoiceBar b) {
                  return Tab(text: b.title, icon: new Icon(b.icon));
                }).toList()),
              ),
              body: new TabBarView(
                  children: Mainvm().showTabBar().map((ChoiceBar b) {
                return new Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: new ChoiceCard(choiceBar: b),
                );
              }).toList()),
            ),
          )),
      debugShowCheckedModeBanner: false,
    );
  }
}
