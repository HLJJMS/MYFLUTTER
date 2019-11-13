
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _LoginPageState();
  }
}

class _LoginPageState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var phone = new TextEditingController();
    var password = new TextEditingController();
    HttpClient _httpClient = HttpClient();
    var url="http://47.105.78.210:11420/api/";
    ok() async {
      print("账号；${phone.text}");
      print("密码；${password.text}");
      var params = Map<String, String>();
      params["mobile"] = phone.text;
      params["password"] = password.text;
      params["ip"] ="10.0.2.15";
      params["gps"] = "California Mountain View Mountain View ";
      params["phoneModel"] = "android";
      FormData data= FormData.from({
        "mobile":phone.text,
        "password":password.text,
      });
      Response   response = await Dio().post(url,data: data);
      var shuju =json.decode(response.toString());
      print("post方式->status: ${shuju}");
//      Response  response = await Dio().get("http://api.go2map.com/engine/api/regeocoder/json?points=113.921076000000,22.499654000000&type=1");
//      print("结果；${ response.toString()}");
    }
    return Scaffold(
        appBar: new AppBar(
          title: new Text("登录"),
        ),
        body: new Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Text(
                  "欢迎登录消费分期",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                new TextField(
                  controller: phone,
                  decoration: InputDecoration(
                    labelText: '请输入手机号',
                    //设置输入框前面有一个电话的按钮 suffixIcon
                    suffixIcon: Icon(Icons.phone),
                    labelStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
                new TextField(
                  controller: password,
                  decoration: InputDecoration(
                    labelText: '请输入验证码',
                    suffixIcon: Icon(Icons.remove_red_eye),
                    labelStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
                new Container(
                  width: 360.0,
                  margin: new EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0.0),
                  padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: new Card(
                    color: Colors.green,
                    elevation: 6.0,
                    child: new FlatButton(
                        onPressed: ok,
                        child: new Text(
                          "登录",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                  ),
                )
              ],
            )));
  }
}
