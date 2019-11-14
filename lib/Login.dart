import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:http/http.dart' as http;

import 'bean_entity.dart';

class Login extends StatefulWidget {
  String txt="0";
  Login({this.txt});
  @override
  State<StatefulWidget> createState() {
    print(txt);
    return new _LoginPageState(txt: txt);
  }

}

class _LoginPageState extends State<Login> {
  String txt;
  _LoginPageState({this.txt});
  @override
  Widget build(BuildContext context) {
    var phone = new TextEditingController();
    var password = new TextEditingController();
    HttpClient _httpClient = HttpClient();
    var url = "http://47.105.78.210:11420/api/";
    var url2 = "http://api.go2map.com/engine/api/regeocoder/json?";
    ok() async {
      print("账号；${phone.text}");
      print("密码；${password.text}");
      var params = Map<String, String>();
      params["mobile"] = phone.text;
      params["password"] = password.text;
      params["ip"] = "10.0.2.15";
      params["gps"] = "California Mountain View Mountain View ";
      params["phoneModel"] = "android";
      FormData data = FormData.from({
        "points": "113.921076000000,22.499654000000",
        "type": "1",
      });
      Response response = await Dio().post(url2, data: data);
      var shuju = json.decode(response.toString());
      print("post方式->status: ${shuju}");
//      Response  response = await Dio().get("http://api.go2map.com/engine/api/regeocoder/json?points=113.921076000000,22.499654000000&type=1");
//      print("结果GET；${ response.toString()}");
//      var shuju =json.decode(response.toString());
//      BeanEntity bean=BeanEntity.fromJson(shuju);
//     var a = bean.response.data.elementAt(0).address;
//      print("结果；${a}");
    }


    exit(){
      Navigator.pop(context);
    }
    return Scaffold(
      appBar: new AppBar(
        title: new Text(txt),
        centerTitle: true,
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
//                  相当于mach_parent
          width: double.infinity,
          margin: new EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0.0),
          child: new MaterialButton(
              color: Colors.green,
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(23))),
              onPressed: ok,
              child: new Text(
                "登录",
                style: TextStyle(color: Colors.white, fontSize: 16),
              )),
        ),
        new MaterialButton(onPressed: exit,
            child: new Text(
              "退出",
              style: TextStyle(color: Colors.black, fontSize: 16),
            )),
      ],
    )));
  }
}
