import 'package:customor_manager/viewmodel/Settingvm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class NewCutomerv extends StatefulWidget {
  @override
  _NewCutomerv createState() => _NewCutomerv();
}

class _NewCutomerv extends State<NewCutomerv> {
  DateTime timeval = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('zh', 'CH'), const Locale('en', 'US')],
      locale: Locale('zh'),
      title: '新增',
      theme: ThemeData(
        brightness: Settingvm().getAppTheme(),
        primarySwatch: Colors.orange,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          //centerTitle: true,
          elevation: 10,
          title: Text(
            '客户信息',
            textAlign: TextAlign.center,
            textScaleFactor: 1,
          ),
        ),
        body: new Container(
          padding: EdgeInsets.all(80),
          //decoration: new BoxDecoration()
          //color: Colors.blueGrey,
          //border: new Border.all(color: Colors.black54, width: 4.0),
          //borderRadius: new BorderRadius.circular(12.0)),
          child: new Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    labelText: '名称', fillColor: Colors.orangeAccent),
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: '联系人', fillColor: Colors.orangeAccent),
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: '地址', fillColor: Colors.orangeAccent),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('创建时间', style: TextStyle(fontWeight: FontWeight.bold)),
                FlatButton(
                    child: Text(formatDate(this.timeval)),
                    onPressed: () {
                      showDatePicker(
                        locale: Locale('en'),
                        context: context,
                        initialDate: new DateTime.now(),
                        firstDate: new DateTime.now()
                            .subtract(new Duration(days: 8000)), // 减 30 天
                        lastDate: new DateTime.now()
                            .add(new Duration(days: 1000)), // 加 30 天
                      ).then((val) {
                        setState(() {
                          this.timeval = val;
                        });
                      }).catchError((err) {
                        print(err);
                      });
                    })
              ]),
              MaterialButton(
                  child: Text('提交'),
                  onPressed: () {
                    submit();
                  })
            ],
          ),
        ),
      ),
      //debugShowCheckedModeBanner: false, //取消debug模式
    );
  }

  String formatDate(DateTime dateTime) {
    if (dateTime != null)
      return timeval.year.toString() +
          '-' +
          timeval.month.toString() +
          '-' +
          timeval.day.toString();
    else {
      DateTime now = DateTime.now();
      return now.year.toString() +
          '-' +
          now.month.toString() +
          '-' +
          now.day.toString();
    }
  }

  void submit() {}
}
