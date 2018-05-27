import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//集成了支持json、utf-8等数据格式的编码和解码器
class NetWorkPage extends StatefulWidget {
  @override
  ListViewPageState createState() => new ListViewPageState();
}

class ListViewPageState extends State<NetWorkPage> {
  var _ipAddress = '响应数据';  //为啥要定义这个变量呢？为了后面只需要写一次setState()
  //异步执行用到async关键字
  _getIPAddress() async {
    /*接口url地址，包含了请求地址http://op.juhe.cn/onebox/weather/query和两个参数cityname、AppKey*/
    var url = 'http://wallet.liaoyantech.cn/api/v1/wallet/';
    var httpClient = new http.Client();
    Map<String, String> headers = {
      'os_type': "0",
      'Accept-Language': "en_us",
      'mw-token': ""
    };

      httpClient.get('${url}/country/listCountries',headers:headers).then((response) {
        printResponseBody(response);
        //优点 可以连续请求,请求全部完成后进行close
        return httpClient.get('${url}/country/listCountries');
      }).then(printResponseBody)
      .whenComplete(httpClient.close);
  }

  @override
  Widget build(BuildContext context) {
    var spacer = new SizedBox(height: 32.0);

    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              onPressed: _getIPAddress,
              child:new Text('请求国家列表接口')// new CustomScrollView(), //   new Text('请求国家列表'),
            ),
            new Text('$_ipAddress.'),
            spacer,
          ],
        ),
      ),
    );
  }

  printResponseBody(response) {
    Map data= jsonDecode(response.body);
    setState(() {
      _ipAddress = "json 解析后数据： \n\n 返回码code:${data["code"]} \n 返回message:${data["message"]}  \n ";
    });
    print("响应状态： ${response.statusCode}");
    print("响应正文： ${response.body}");
    print("解析响应message： ${data["message"]}");
  }
}
