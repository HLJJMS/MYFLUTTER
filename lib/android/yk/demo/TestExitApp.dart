import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TestExitApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TestExitAppState();
  }
}

class TestExitAppState extends State<TestExitApp> {
  DateTime lastPopTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: new AppBar(
          title: new Text("点击两次返回，退出APP"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 50.0,
            ),
            Container(
              height: 50.0,
            ),
            Container(
              height: 50.0,
            ),
            Container(
              height: 50.0,
            ),
            Container(
              height: 50.0,
            ),
          ],
        ),
      ),
      onWillPop: () async {
        // 点击返回键的操作
        if (lastPopTime == null ||
            DateTime.now().difference(lastPopTime) > Duration(seconds: 2)) {
          lastPopTime = DateTime.now();
          Fluttertoast.showToast(msg: '再按一次退出');
        } else {
          lastPopTime = DateTime.now();
          // 退出app
          await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        }
      },
    );
  }
}
