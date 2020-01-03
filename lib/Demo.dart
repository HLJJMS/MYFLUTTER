import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/ListDemo.dart';
import 'package:flutter_app/application.dart';
import 'package:flutter_app/tool/push_help.dart';
import 'package:flutter_app/util/routerUtil.dart';
import 'package:flutter_app/util/toastUtil.dart';

class Demo extends StatelessWidget {
  // 创建一个给native的channel (类似iOS的通知）
  static const methodChannel = const MethodChannel('com.example.flutterApp');

  Demo({this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    //监听推送
    listenPush((String message) {
      showToast('推送内容 == ' + message);
    });

    return new Scaffold(
      appBar: new AppBar(
        title: Center(
          child: Text('首页'),
        ),
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: () => print('menu菜单按钮被点击！'),
        ),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () => print('search菜单按钮被点击！')),
          //隐藏的菜单
          new PopupMenuButton<String>(
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
              this.SelectView(Icons.message, '发起群聊', 'A'),
              this.SelectView(Icons.group_add, '添加服务', 'B'),
              this.SelectView(Icons.cast_connected, '扫一扫码', 'C'),
            ],
            onSelected: (String action) async {
              // 点击选项的时候
              switch (action) {
                case 'A':
                  print('你选择了A');
                  var result = await Navigator.pushNamed(context, "secondPage",
                      arguments: "111222");
                  print("demo 从secondPage页返回值：$result");
                  break;
                case 'B':
                  print('你选择了B');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ListDemoPage()));
                  break;
                case 'C':
                  print('你选择了C');
                  Navigator.pushNamed(context, "stateDemoPage");
                  break;
              }
            },
          ),
        ],
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new FlatButton(
                  //child按钮中的内容
                  textColor: Colors.white,
                  //文字颜色
                  disabledTextColor: Colors.red,
                  //按钮禁用时的文字颜色
                  color: Colors.lightBlue,
                  //背景颜色
                  disabledColor: Colors.grey,
                  //按钮禁用时的背景颜色
                  highlightColor: Colors.amber,
                  //按钮按下时的背景颜色
                  splashColor: Colors.black12,
                  //点击时，水波动画中水波的颜色
                  padding: EdgeInsets.all(2.0),
                  //内边距
                  colorBrightness: Brightness.dark,
                  ////按钮主题，默认是浅色主题
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                  onPressed: () {
                    print("子树中获取state对象按钮被点击");
                    Navigator.pushNamed(context, "tapboxAPage");
                  },
                  child: Container(
                    height: 30,
                    width: 180,
                    alignment: Alignment.center,
                    child: Text(
                      "子树中获取State对象",
                      style: TextStyle(fontSize: 16),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Container(
                  child: Text(
                    "安卓调用",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                onPressed: () {
                  print("安卓按钮调用");
                  Navigator.pushNamed(context, "androidDemoPage");
                },
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Container(
                  child: Text(
                    "苹果调用",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                onPressed: () {
                  print("苹果按钮调用");
                  RouterUtil.navigateTo(context, "iosDemoPage");
                },
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Container(
                  child: Text(
                    "其他调用",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                onPressed: () {
                  print("其他按钮调用");
                  // Navigator.pushNamed(context, "otherMainPage");
                  Application.router.navigateTo(context, "otherMainPage");
                },
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Container(
                  child: Text(
                    "权限测试",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                onPressed: () {
                  print("测试获取权限");
                  Navigator.pushNamed(context, "yk/TestPermission");
                },
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Container(
                  child: Text(
                    "调用美洽",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                onPressed: () {
                  print("调用美洽");
                  goToChat();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future goToChat() async {
    await methodChannel.invokeMethod('MQChat', '参数');
  }

  SelectView(IconData icon, String text, String id) {
    return new PopupMenuItem<String>(
      value: id,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Icon(icon, color: Colors.blue),
          new Text(text),
        ],
      ),
    );
  }
}
