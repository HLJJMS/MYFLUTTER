import 'package:flutter/material.dart';
import 'package:flutter_app/util/routerUtil.dart';

class GestureListScreen extends StatefulWidget {
  GestureListScreen({Key key}) : super(key: key);

  @override
  _GestureListScreenState createState() => _GestureListScreenState();
}

class _GestureListScreenState extends State<GestureListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手势事件Demo列表'),
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
                  child: Text("原始指针事件"),
                  onPressed: () {
                    // Navigator.pushNamed(context, "lc/tabbar/demo1");
                    RouterUtil.navigateTo(context, "lc/gesture/listener");
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
                  child: Text("GestureDetector手势识别"),
                  onPressed: () {
                    // Navigator.pushNamed(context, "lc/tabbar/demo1");
                    RouterUtil.navigateTo(context, "lc/gesture/detector");
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
                  child: Text("拖拽控件"),
                  onPressed: () {
                    // Navigator.pushNamed(context, "lc/tabbar/demo1");
                    RouterUtil.navigateTo(context, "lc/gesture/drag");
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
                  child: Text("缩放控件"),
                  onPressed: () {
                    // Navigator.pushNamed(context, "lc/tabbar/demo1");
                    RouterUtil.navigateTo(context, "lc/gesture/scale");
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
                  child: Text("手势识别"),
                  onPressed: () {
                    // Navigator.pushNamed(context, "lc/tabbar/demo1");
                    RouterUtil.navigateTo(context, "lc/gesture/recognizer");
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
                  child: Text("滚动事件通知"),
                  onPressed: () {
                    RouterUtil.navigateTo(context, "lc/gesture/scroll");
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
