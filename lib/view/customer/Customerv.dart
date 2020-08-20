import 'package:customer_manager/common/CustomerS.dart';
import 'package:customer_manager/view/customer/CustomerDetail.dart';
import 'package:customer_manager/viewmodel/Customervm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///客户界面,显示所有客户
class Customerv extends StatefulWidget {
  @override
  _Customerv createState() => _Customerv();
}

class _Customerv extends State<Customerv> {
  Customervm customervm = null;
  List<CustomerS> customerlist;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => Customervm(),
          )
        ],
        child: Consumer<Customervm>(builder: (context, cust, child) {
          customervm = cust;
          switch (customervm.showCutomerListState) {
            case -1:
              return MaterialButton(
                  onPressed: () {
                    customervm.showCutomerList();
                  },
                  child: Icon(Icons.refresh));
              break;
            case 0:
              customervm.showCutomerList();
              return CircularProgressIndicator();
              break;
            case 1:
              return getCustomerlist();
          }
        }));
  }

  Widget getCustomerlist() {
    customerlist = customervm.customerlist;
    return new AnimatedList(
        key: _listKey,
        initialItemCount: customerlist.length,
        itemBuilder: (context, index, animation) {
          CustomerS customer = customerlist[index];
          return new SizeTransition(
              sizeFactor: animation,
              child: new Card(
                  color: Colors.white,
                  child: new Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Image.network(
                          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597061650862&di=73cad2c236afefc95935b6dfacbd9b2e&imgtype=0&src=http%3A%2F%2Fa1.att.hudong.com%2F62%2F02%2F01300542526392139955025309984.jpg',
                          height: 100,
                          scale: 2,
                        ),
                        loadingCustomDetail(customer)
                        //loadCustomDetial(index)
                        //new Text(
                        //  "${items[index]}",
                        //  textScaleFactor: 2,
                        //)
                      ])));
        });
  }

  Widget loadingCustomDetail(CustomerS customer) {
    return new CutomerDetail(customer.id, customer);
  }
}
