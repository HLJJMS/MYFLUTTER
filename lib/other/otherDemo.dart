import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/util/routerUtil.dart';

import '../application.dart';

class OtherDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("other调用练习"),
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
                child: Text("liuc测试"),
                onPressed: () {
                  // Navigator.pushNamed(context, "lc/homePage");
                  Application.router.navigateTo(context, "lc/home_page");
                  // RouterUtil.navigateTo(context, "lc/home_page");
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
