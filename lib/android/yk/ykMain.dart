import 'package:flutter/material.dart';
import 'package:flutter_app/util/PermissionUtil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import 'ykRouter.dart';

class YKMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("我的主页"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new RaisedButton(
            color: Colors.green[900],
            child: new Text('跳转demo列表'),
            onPressed: () {
              Navigator.pushNamed(context, "yk/FirstScreen");
            },
          ),
          new RaisedButton(
            color: Colors.green[800],
            child: new Text('跳转widgets'),
            onPressed: () {
              Navigator.pushNamed(context, ROUTES_WIDGETS_MAIN_VIEW);
            },
          ),
        ],
      ),
    );
  }
}
