import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

import 'bean/address_bean_entity.dart';

class Login extends StatefulWidget {
  String txt = "0";

  Login({this.txt});

  @override
  State<StatefulWidget> createState() {
    print(txt);
    return new _LoginPageState(txt: txt);
  }
}

class _LoginPageState extends State<Login> {
  String x = "";
  String y = "";
  String txt;
  String result = "";
  TextEditingController _x = TextEditingController();
  TextEditingController _y = TextEditingController();
  IconData closeEye = Icons.maximize;
  IconData openEye = Icons.remove_red_eye;
  IconData eyeIcon = Icons.remove_red_eye;
  var codeColor = Colors.deepOrangeAccent;
  bool isPsw = false;
  bool isCodeView = false;
  double upTitle = 0.0;
  double downTitle = 0.0;
  String codeTitle = "验证码";
  String pswTitle = "登录密码";
  String twoTitle = "登录密码";
  String codeTxt = "获取验证码";

  _LoginPageState({this.txt});

  var url2 = "http://api.go2map.com/engine/api/regeocoder/json?";
  ok() async {
    print("账号；${x}");
    print("密码；${y}");
    var params = Map<String, String>();
    params["mobile"] = x;
    params["password"] = y;
    params["ip"] = "10.0.2.15";
    params["gps"] = "California Mountain View Mountain View ";
    params["phoneModel"] = "android";
    // FormData data = FormData.from({
    //   "points": "113.921076000000,22.499654000000",
    //   "type": "1",
    // });
//      Response response = await Dio().post(url2, data: data);
//      var shuju = json.decode(response.toString());
//      print("post方式->status: ${shuju}");
    Response response = await Dio().get(
        "http://api.map.baidu.com/geocoder?output=json&location=${x},${y}&ak=esNPFDwwsXWtsQfw4NMNmur1");
    print("结果GET；${response.toString()}");
    var shuju = json.decode(response.toString());
    AddressBeanEntity bean = AddressBeanEntity.fromJson(shuju);
    print(bean.result.toString());
    setState(() {
      result = bean.result.addressComponent.city.toString();
    });
  }

//    相当于finnesh
  exit() {
    Navigator.pop(context);
  }

  eye() {
    setState(() {
      if (isPsw == true) {
        eyeIcon = openEye;
        isPsw = false;
      } else {
        eyeIcon = closeEye;
        isPsw = true;
      }
    });
  }

  _TitleHide(String txt, int id) {
//      id =1 时代表上边的
    print(txt);
    print(id.toString());

    setState(() {
      if (txt.length > 0 && id == 1) {
        upTitle = 1.0;
      } else if (txt.length > 0 && id == 2) {
        downTitle = 1.0;
      } else if (txt.length == 0 && id == 1) {
        upTitle = 0.0;
      } else {
        downTitle = 0.0;
      }
    });
  }

  _changeView() {
    setState(() {
      if (twoTitle == codeTitle) {
        isCodeView = false;
        twoTitle = pswTitle;
      } else {
        isCodeView = true;
        twoTitle = codeTitle;
      }
    });
  }

  _TimerDown() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: new Text(txt),
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: new Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                exit();
              },
            ),
            actions: <Widget>[
              new Container(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                alignment: Alignment.center,
                child: new Text(
                  "注册",
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
          body: new SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: new Container(
                color: Colors.white,
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Container(
                      child: new Text(
                        "欢迎登录消费分期",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 25,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    ),
                    new Container(
                      padding: EdgeInsets.fromLTRB(0, 47, 0, 0),
                      child: new Opacity(
                        opacity: upTitle,
                        child: new Text(
                          "登录账号",
                          style: TextStyle(
                            color: Colors.black26,
                          ),
                        ),
                      ),
                    ),
                    new Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Expanded(
                            child: new TextField(
                              controller: _x,
                              keyboardType: TextInputType.number,
                              onChanged: (text) {
                                _TitleHide(text, 1);
                              },
                              decoration: InputDecoration(
                                hintText: "请输入账号",
                                border: InputBorder.none,
                                fillColor: Colors.transparent,
                                //设置输入框前面有一个电话的按钮 suffixIcon
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          new IconButton(
                              icon: new Icon(Icons.cancel),
                              onPressed: () {
                                _x.clear();
                              }),
                        ],
                      ),
                    ),
                    new Container(
                      color: Colors.black12,
                      height: 1,
                      width: double.infinity,
                    ),
                    new Container(
                      padding: EdgeInsets.fromLTRB(0, 18, 0, 0),
                      child: new Opacity(
                        opacity: downTitle,
                        child: new Text(
                          "登录密码",
                          style: TextStyle(
                            color: Colors.black26,
                          ),
                        ),
                      ),
                    ),
                    new Container(
                      padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                      child: new Row(
                        children: <Widget>[
                          new Expanded(
                            child: new TextField(
                              controller: _y,
                              obscureText: isPsw,
                              onChanged: (text) {
                                _TitleHide(text, 2);
                              },
                              decoration: InputDecoration(
                                hintText: "请输入密码",
                                border: InputBorder.none,
                                fillColor: Colors.transparent,
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          new Offstage(
                            offstage: isCodeView,
                            child: new IconButton(
                                icon: new Icon(Icons.cancel),
                                onPressed: () {
                                  _y.clear();
                                }),
                          ),
                          new Offstage(
                            offstage: isCodeView,
                            child: new IconButton(
                                icon: new Icon(eyeIcon),
                                onPressed: () {
                                  eye();
                                }),
                          ),
                          new Offstage(
                            offstage: !isCodeView,
                            child: new GestureDetector(
                              child: new Text(
                                codeTitle,
                                style: TextStyle(
                                  color: codeColor,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    new Container(
                      color: Colors.black12,
                      height: 1,
                      width: double.infinity,
                    ),
                    new Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new GestureDetector(
                            child: new Text(
                              twoTitle,
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black26),
                            ),
                            onTap: () {
                              _changeView();
                            },
                          ),
                          new GestureDetector(
                            child: new Text(
                              "忘记密码",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black26),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    new Container(
//                  相当于mach_parent
                      width: double.infinity,
                      height: 45,
                      margin: new EdgeInsets.fromLTRB(10.0, 68.0, 10.0, 0.0),
                      child: new MaterialButton(
                          color: Colors.blueAccent,
                          padding: EdgeInsets.fromLTRB(0, 11, 0, 11),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(23))),
                          onPressed: ok,
                          child: new Text(
                            "登录",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )),
                    ),
                    new Container(
                        margin: EdgeInsets.fromLTRB(0, 22, 0, 0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text(
                              "登录遇到问题？点击",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black26),
                            ),
                            new GestureDetector(
                              child: new Text(
                                "联系客服",
                                style:
                                    TextStyle(fontSize: 14, color: Colors.blue),
                              ),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CupertinoAlertDialog(
                                        title: Text("咨询热线"),
                                        content: SizedBox(
                                          child: SingleChildScrollView(
                                            child: ListBody(
                                              children: <Widget>[
                                                Text("电话：1956987456"),
                                              ],
                                            ),
                                          ),
                                        ),
                                        actions: <Widget>[
                                          CupertinoDialogAction(
                                            child: Text("取消"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                              print("取消");
                                            },
                                          ),
                                          CupertinoDialogAction(
                                            child: Text("确定"),
                                            onPressed: () {
                                              print("确定");
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                            ),
                          ],
                        )),
                    new Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(0, 139, 0, 30),
                      child: new Text(
                        "当前版本:1.0",
                        style: TextStyle(fontSize: 13, color: Colors.black12),
                      ),
                    )
                  ],
                )),
          ),
    );
  }
}
