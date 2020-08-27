import 'dart:convert';
import 'dart:io';
import 'package:customer_manager/common/pool.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Customerm {
  getCustomerlist(String needrow, String page) async {
    String url =
        pool.host + "/getcustomerlist?needrow=" + needrow + "&page=" + page;
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
      var response = await client.post(url);
      print("结束");
      var json = response.body;
      print(json);
    } on http.ClientException catch (ex) {
      print("获取客户列表错误:" + ex.message);
      return null;
    }

    //}
  }
}
