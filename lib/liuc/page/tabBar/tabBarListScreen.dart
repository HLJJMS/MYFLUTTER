import 'package:flutter/material.dart';
import 'package:flutter_app/util/routerUtil.dart';

class TabBarListScreen extends StatefulWidget {
  TabBarListScreen({Key key}) : super(key: key);

  @override
  _TabBarListScreenState createState() => _TabBarListScreenState();
}

class _TabBarListScreenState extends State<TabBarListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tabBar列表'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Center(
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("简单tabbar"),
                  onPressed: () {
                    // Navigator.pushNamed(context, "lc/tabbar/demo1");
                    RouterUtil.navigateTo(context, "lc/tabbar/demo1");
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Center(
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("自定义TabBar"),
                  onPressed: () {
                    // Navigator.pushNamed(context, "lc/tabbar/demo1");
                    RouterUtil.navigateTo(context, "lc/tabbar/myTab");
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Center(
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("银多自定义TabBar"),
                  onPressed: () {
                    // Navigator.pushNamed(context, "lc/tabbar/demo1");
                    RouterUtil.navigateTo(context, "lc/tabbar/ydtab");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
