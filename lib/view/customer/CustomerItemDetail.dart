import 'package:customor_manager/viewmodel/customer/CustomerItemDetialvm.dart';
import 'package:customor_manager/viewmodel/settingvm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomerItemDetail extends StatefulWidget {
  @override
  _CustomerItemDetail createState() => _CustomerItemDetail();
}

class _CustomerItemDetail extends State<CustomerItemDetail> {
  DateTime timeval = DateTime.now();
  List<int> vipitems = CustomerItemDetailvm().showVIP();
  int vipval = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
          //centerTitle: true,
          elevation: 10,
          title: Text(
            '项目信息',
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
                    labelText: '详细信息', fillColor: Colors.orangeAccent),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('客户等级'),
                    DropdownButton<int>(
                      value: vipval,
                      items: vipitems
                          .map((e) => new DropdownMenuItem(
                              value: e, child: Text(e.toString())))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          vipval = val;
                        });
                      },
                    )
                  ]),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: '费用金额', fillColor: Colors.orangeAccent),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('创建时间', style: TextStyle(fontWeight: FontWeight.bold)),
                FlatButton(
                    child: Text(formatDate(this.timeval)),
                    onPressed: () {
                      showDatePicker(
                        //locale: Locale('en'),
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

  void submit() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('SUBMIT'),
            ));
  }
}
