import 'dart:convert';
import 'dart:io';
import 'package:customer_manager/common/pool.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Customerm {
  getCustomerlist(String needrow, String page) async {
    String url = pool.host + "/getcustomerlist";
    /*if (Platform.isAndroid) {
      var httpClient = new HttpClient();
      try {
        var request = await httpClient.postUrl(Uri.parse(url));
        var response = await request.close();
        if (response.statusCode == HttpStatus.ok) {
          var json = await response.transform(utf8.decoder).join();
          var data = jsonDecode(json);
          return data;
        }
      } catch (ex) {
        return "ERROR:" + ex;
      }
    }*/

    //if (kIsWeb) {
    print("开始");
    var client = http.Client();
    try {
      print(url);
      client.post(url,
          body: 'needrow=' + needrow + "&page=" + page,
          headers: {"Access-Control-Allow-Origin": "*"}).then((response) {
        var json = jsonDecode(response.body);
        print("结束");
      });

      print(json);
    } on http.ClientException catch (ex) {
      print("获取客户列表错误:" + ex.message);
      return null;
    }

    //}
  }
}
