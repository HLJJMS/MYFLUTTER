import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/android/tyhdemo/CityView.dart';
import 'package:flutter_app/android/tyhdemo/DongHua.dart';
import 'package:flutter_app/android/tyhdemo/Login.dart';
import 'package:flutter_app/android/tyhdemo/LunBoTu.dart';
import 'package:flutter_app/android/tyhdemo/MeiQia.dart';
import 'package:flutter_app/android/tyhdemo/SQLView.dart';
import 'package:flutter_app/android/tyhdemo/SqlAndSP.dart';
import 'package:flutter_app/android/tyhdemo/UpTabTwoView.dart';
import 'package:flutter_app/android/tyhdemo/UpTabView.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import 'DiyTabView.dart';
import 'ListView.dart';
import 'LoanView.dart';
import 'TabView.dart';

class TyhMenu extends StatelessWidget {
  int last = 0;
  int now = 0;
  static const platform = const MethodChannel("samples.flutter.io/jiaohu");

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "田羽衡练习页导航",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.yellow,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    new FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyListView()));
                        },
                        child: new Text(
                          "LISTVIEW示例（仿制退换/售后）",
                          style: TextStyle(color: Colors.black),
                        ),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20)),
                    new FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login(
                                        txt: "",
                                      )));
                        },
                        child: new Text(
                          "网络请求示例",
                          style: TextStyle(color: Colors.black),
                        ),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20)),
                    new FlatButton(
                        onPressed: () {
                          doCall();
                        },
                        child: new Text(
                          "权限请求示例（打电话）",
                          style: TextStyle(color: Colors.black),
                        ),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20)),
                    new FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DongHua()));
                        },
                        child: new Text(
                          "动画演示",
                          style: TextStyle(color: Colors.black),
                        ),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20)),
                    new FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CityView()));
                        },
                        child: new Text(
                          "层次",
                          style: TextStyle(color: Colors.black),
                        ),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20)),
                    new FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GridView()));
                        },
                        child: new Text(
                          "网格",
                          style: TextStyle(color: Colors.black),
                        ),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20)),
                    new FlatButton(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MeiQia()));
                        },
                        child: new Text(
                          "进入美洽交互页",
                          style: TextStyle(color: Colors.black),
                        ),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20)),
                    new FlatButton(
                        onPressed: () {
                          _getAndroidMessage();
                        },
                        child: new Text(
                          "测试调用Android交互",
                          style: TextStyle(color: Colors.black),
                        ),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20)),
                    new FlatButton(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SqlAndSP()));
                        },
                        child: new Text(
                          "进入数据存储测试界面",
                          style: TextStyle(color: Colors.black),
                        ),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20)),
                    new FlatButton(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LunBoTu()));
                        },
                        child: new Text(
                          "轮播图",
                          style: TextStyle(color: Colors.black),
                        ),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20)),
                    new FlatButton(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TabView()));
                        },
                        child: new Text(
                          "Tab底部导航栏",
                          style: TextStyle(color: Colors.black),
                        ),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20)),
                    new FlatButton(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DiyTabView()));
                        },
                        child: new Text(
                          "自定义导航栏",
                          style: TextStyle(color: Colors.black),
                        ),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20)),
                    new FlatButton(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpTabView()));
                        },
                        child: new Text(
                          "上方导航栏",
                          style: TextStyle(color: Colors.black),
                        ),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20)),
                    new FlatButton(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpTabTwoView()));
                        },
                        child: new Text(
                          "上方导航栏",
                          style: TextStyle(color: Colors.black),
                        ),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20)),
                    new FlatButton(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SQLView()));
                        },
                        child: new Text(
                          "数据库测试",
                          style: TextStyle(color: Colors.black),
                        ),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20)),
                    new FlatButton(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoanView()));
                        },
                        child: new Text(
                          "仿制借钱页",
                          style: TextStyle(color: Colors.black),
                        ),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20)),
                  ],
                ),
              ))),
      onWillPop: () async {
        now = DateTime.now().millisecondsSinceEpoch;
        if (now - last > 2000) {
          last = DateTime.now().millisecondsSinceEpoch;
          Fluttertoast.showToast(msg: "再按一次退出");
          return Future.value(false);
        } else {
          await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          return Future.value(true);
        }
      },
    );
  }

  Future doCall() async {
    PermissionStatus status =
        await PermissionHandler().checkPermissionStatus(PermissionGroup.phone);
    if (status != PermissionStatus.granted) {
      await PermissionHandler().requestPermissions([PermissionGroup.phone]);
      bool isShow = await PermissionHandler()
          .shouldShowRequestPermissionRationale(PermissionGroup.phone);
      if (!isShow) {
        await PermissionHandler().openAppSettings();
      } else {
        if (PermissionStatus.granted ==
            await PermissionHandler()
                .checkPermissionStatus(PermissionGroup.storage)) {
          launchTelURL("13512656789");
        } else {}
      }
    } else {
      launchTelURL("13512656789");
    }
  }

  /// 调起拨号页
  static void launchTelURL(String phone) async {
    String url = 'tel:' + phone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<Null> _getAndroidMessage() async {
    print("走方法了");
    final String result = await platform.invokeMethod("getMessage");
    print(result);
    Fluttertoast.showToast(msg: result);
  }
}
