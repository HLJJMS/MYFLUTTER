import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/android/qfdemo/Flutter_webview_plugin.dart';
import 'package:flutter_app/util/toastUtil.dart' as toastUtil;

class qfRouterPage extends StatelessWidget {
  DateTime lastPopTime;
  static const platform = const MethodChannel("com.example.flutterApp");

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text("qf"),
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
                  child: Text("scrollController"),
                  onPressed: () {
                    Navigator.pushNamed(context, "qf/scrollController");
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(18),
                ),
                FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("loginPage"),
                  onPressed: () {
                    Navigator.pushNamed(context, "qf/loginPage");
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
                Padding(
                  padding: EdgeInsets.all(18),
                ),
                FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("customScrollView"),
                  onPressed: () {
                    Navigator.pushNamed(context, "qf/customScrollView");
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
                Padding(
                  padding: EdgeInsets.all(18),
                ),
                FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("升级demo"),
                  onPressed: () {
                    Navigator.pushNamed(context, "qf/upApk");
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
                Padding(
                  padding: EdgeInsets.all(18),
                ),
                FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("webview_flutter"),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("qf/webview");
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
                Padding(
                  padding: EdgeInsets.all(18),
                ),
                FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Flutter_webview_plugin.dart"),
                  onPressed: () {
                    Navigator.of(context).push(

                        new MaterialPageRoute(builder: (context) {
                          return new WebViewPage("https://www.taptap.com/","WebViewDemo");//url为要跳转的地址,title为需要传递的参数
                        },
                        ));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      // ignore: missing_return
//      onWillPop: () async {
//        // 点击返回键的操作
//        if (lastPopTime == null ||
//            DateTime.now().difference(lastPopTime) > Duration(seconds: 2)) {
//          lastPopTime = DateTime.now();
//          toastUtil.showToast("再按一次退出");
//        } else {
//          lastPopTime = DateTime.now();
//          // 退出app
//          await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
//        }
//      },
    );
  }

}
