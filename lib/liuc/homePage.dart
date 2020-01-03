import 'package:flutter/material.dart';
import 'package:flutter_app/util/routerUtil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("liu调用页面"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Center(
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("混合状态管理"),
                  onPressed: () {
                    Navigator.pushNamed(context, "lc/tapboxCPage");
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Center(
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Text练习"),
                  onPressed: () {
                    Navigator.pushNamed(context, "lc/text_demo_page");
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Center(
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("GridView练习"),
                  onPressed: () {
                    Navigator.pushNamed(context, "lc/gridView_demo_page");
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Center(
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("ListView练习"),
                  onPressed: () {
                    Navigator.pushNamed(context, "lc/listView_demo_page");
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Center(
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Animation动画练习"),
                  onPressed: () {
                    Navigator.pushNamed(context, "lc/anim_demo_page");
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Center(
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("toast提示"),
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg:
                          "This is Colored Toast with android duration of 5 Sec",
                      toastLength: Toast.LENGTH_SHORT,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Center(
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("新闻列表页"),
                  onPressed: () {
                    Navigator.pushNamed(context, "lc/news/list");
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Center(
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("ONE一个"),
                  onPressed: () {
                    // Navigator.pushNamed(context, "lc/news/one");
                    // 第一种方式(传统url) ："lc/news/one?id=${Uri.encodeComponent('345')}"
                    // 第二种方式(restful) ："lc/news/one/${Uri.encodeComponent('123')}"
                    Navigator.of(context)
                        .pushNamed("lc/news/one/${Uri.encodeComponent('123')}");
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Center(
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("回到首页"),
                  onPressed: () {
                    // Navigator.pushNamed(context, "lc/news/one");
                    // Navigator.of(context).pushNamed("/");
                    RouterUtil.navigateTo(context, "/", clearStack: true);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Center(
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("provider"),
                  onPressed: () {
                    // Navigator.pushNamed(context, "lc/news/one");
                    // Navigator.of(context).pushNamed("/");
                    RouterUtil.navigateTo(context, "/lc/provider");
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Center(
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("容器练习"),
                  onPressed: () {
                    // Navigator.pushNamed(context, "lc/news/one");
                    // Navigator.of(context).pushNamed("/");
                    RouterUtil.navigateTo(context, "/lc/box_test");
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Center(
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("表单练习"),
                  onPressed: () {
                    // Navigator.pushNamed(context, "lc/news/one");
                    // Navigator.of(context).pushNamed("/");
                    RouterUtil.navigateTo(context, "/lc/form");
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Center(
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("tab选项卡练习"),
                  onPressed: () {
                    // Navigator.pushNamed(context, "lc/news/one");
                    // Navigator.of(context).pushNamed("/");
                    RouterUtil.navigateTo(context, "/lc/tabbar/list");
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Center(
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("手势事件练习"),
                  onPressed: () {
                    // Navigator.pushNamed(context, "lc/news/one");
                    // Navigator.of(context).pushNamed("/");
                    RouterUtil.navigateTo(context, "/lc/gesture/list");
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Center(
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("动画"),
                  onPressed: () {
                    // Navigator.pushNamed(context, "lc/news/one");
                    // Navigator.of(context).pushNamed("/");
                    RouterUtil.navigateTo(context, "/lc/animatable/list");
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
