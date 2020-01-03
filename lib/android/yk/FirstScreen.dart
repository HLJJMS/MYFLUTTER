import 'package:flutter/material.dart';
import 'package:flutter_app/util/PermissionUtil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import 'ykRouter.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("第一页"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new RaisedButton(
            color: Colors.green[50],
            child: new Text('跳转到第二页'),
            onPressed: () {
              Navigator.pushNamed(context, "yk/SecondScreen");
            },
          ),
          new RaisedButton(
            color: Colors.green[100],
            child: new Text('跳转列表页'),
            onPressed: () {
              Navigator.pushNamed(context, "yk/ListDemo");
            },
          ),
          new RaisedButton(
            color: Colors.green[200],
            child: new Text('跳转登录页'),
            onPressed: () {
              Navigator.pushNamed(context, "yk/LoginView");
            },
          ),
          new RaisedButton(
            color: Colors.green[300],
            child: new Text('权限'),
            onPressed: () {
              Navigator.pushNamed(context, "yk/TestPermission");
            },
          ),
          RaisedButton(
            color: Colors.green[400],
            child: Text("打开连接"),
            onPressed: _launchURL,
          ),
          RaisedButton(
            child: Text("拨打电话"),
            color: Colors.green[500],
            onPressed: () {
              PermissionUtil.requestPermission([PermissionGroup.phone],
                  result: (map) {
                if (map[PermissionGroup.phone] == PermissionResult.succeed) {
                  _launchPhone();
                } else if (map[PermissionGroup.phone] ==
                    PermissionResult.failure) {
                  PermissionUtil.openAppSettings();
                } else {
                  Fluttertoast.showToast(
                      msg: '${PermissionGroup.phone}获取权限失败，可以再次请求权限');
                }
              });
            },
          ),
          RaisedButton(
            color: Colors.green[600],
            child: Text("点击两次返回，退出APP"),
            onPressed: () {
              Navigator.pushNamed(context, "yk/TestExitApp");
            },
          ),
          RaisedButton(
            color: Colors.green[700],
            child: Text("分享"),
            onPressed: () {
              Share.share('Flutter分享测试\n https://www.baidu.com');
            },
          ),
          RaisedButton(
            color: Colors.green[800],
            child: Text("数据库"),
            onPressed: () {
              Navigator.pushNamed(context, "yk/Book");
            },
          ),
          RaisedButton(
            color: Colors.green[900],
            child: Text("SharedPreferences"),
            onPressed: () {
              Navigator.pushNamed(context, "yk/SharedPreferencesDemo");
            },
          ),
          RaisedButton(
            color: Colors.lightGreen[50],
            child: Text("file存储"),
            onPressed: () {
              Navigator.pushNamed(context, "yk/FileDemo");
            },
          ),
        ],
      ),
    );
  }
}

_launchPhone() async {
  const url = 'tel:13922224444';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL() async {
  const url = 'https://www.baidu.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
