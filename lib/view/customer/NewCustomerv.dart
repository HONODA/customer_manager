import 'package:customor_manager/viewmodel/Settingvm.dart';
import 'package:flutter/material.dart';

class NewCutomerv extends StatefulWidget {
  @override
  _NewCutomerv createState() => _NewCutomerv();
}

class _NewCutomerv extends State<NewCutomerv> {
  DateTime timeval;
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '新增',
      theme: ThemeData(
        brightness: Settingvm().getAppTheme(),
        primarySwatch: Colors.orange,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          elevation: 10,
          title: Text(
            '客户信息',
            textAlign: TextAlign.center,
            textScaleFactor: 2,
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
              TextField(
                  decoration: InputDecoration(
                      labelText: '时间',
                      fillColor: Colors.orangeAccent,
                      helperText: this.timeval.toString()),
                  //enabled: false,
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: new DateTime.now(),
                      firstDate: new DateTime.now()
                          .subtract(new Duration(days: 30)), // 减 30 天
                      lastDate: new DateTime.now()
                          .add(new Duration(days: 30)), // 加 30 天
                    ).then((val) {
                      setState(() {
                        this.timeval = val;
                      });
                    }).catchError((err) {
                      print(err);
                    });
                  }),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false, //取消debug模式
    );
  }
}
