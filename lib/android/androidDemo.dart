import 'package:flutter/material.dart';
import 'package:flutter_app/android/tyhdemo/TyhMenu.dart';
import 'package:flutter_app/android/zlc//login.dart';

import 'yk/FirstScreen.dart';

class AndroidDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("android调用练习"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("父Widget管理子Widget的状态"),
                onPressed: () {
                  Navigator.pushNamed(context, "tapboxBPage");
                },
              ),
              Padding(
                padding: EdgeInsets.all(18),
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("按钮测试"),
                onPressed: () {},
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("齐峰"),
                onPressed: () {
                  Navigator.pushNamed(context, "qifeng");
                },
              ),
              Padding(
                padding: EdgeInsets.all(18),
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("杨昆"),
                onPressed: () {
                  Navigator.pushNamed(context, "yk/YKMain");
                },
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("田羽衡"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TyhMenu()));
                },
              ),
              Padding(
                padding: EdgeInsets.all(18),
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("张利超"),
                onPressed: () {
                  Navigator.pushNamed(context, "zlcMainPage");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
