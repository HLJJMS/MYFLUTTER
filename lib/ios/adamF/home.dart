import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/util/routerUtil.dart';
import 'package:flutter_app/util/toastUtil.dart';

import '../../application.dart';

class homePage extends StatelessWidget {
  const homePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"), //this._pageList[this._currentIndex]
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
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text("Ding"),
            onPressed: () {
              Navigator.pushNamed(context, "dingPage");
            },
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text("陈胜辉"),
            onPressed: () {
              RouterUtil.navigateTo(
                context,
                RouterName.cshPage,
              );
            },
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text("然哥好帅"),
            onPressed: () {
              Navigator.pushNamed(context, "ranGe");
            },
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text("郑群昌"),
            onPressed: () {
              //Navigator.pushNamed(context, "zqcReg");
              //Application.router.navigateTo(context, "zqcReg");
              RouterUtil.navigateTo(
                context,
                "zqc/book",
                clearStack: false,
                transType: TransitionType.inFromLeft,
              );
            },
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text("个人信息"),
            onPressed: () {
              // Navigator.pushNamed(context, "adam");
// Navigator.pushNamed(context, "lc/news/one");
              // 第一种方式(传统url) ："lc/news/one?id=${Uri.encodeComponent('345')}"
              // 第二种方式(restful) ："lc/news/one/${Uri.encodeComponent('123')}"

              // Navigator.of(context).pushNamed("lc/adamPage/${"赵奕然是傻逼"}");
// Navigator.of(context)
//                     .pushNamed("lc/news/one/${Uri.encodeComponent('123')}");
              RouterUtil.navigateTo(context, "zlj/adamPage/${"赵奕然是傻逼"}",
                  transType: TransitionType.inFromRight);
            },
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text("权限电话测试"),
            onPressed: () {
              Navigator.pushNamed(context, "telPage");
            },
          ),
        ],
      ),
    );
  }
}
