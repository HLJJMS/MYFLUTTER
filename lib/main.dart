import 'package:fludftter_app/tab.dart';
import 'package:flutter/material.dart';

import 'main2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',

      home: IndexPage(),
    );
  }
}



class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第二页'),
        leading: FlutterLogo(colors: Colors.lightGreen),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: RaisedButton(
            child: Text('回到上一页'),
            onPressed: () {
              Navigator.pop(context); //2
            }),
      ),
    );
  }
}


class IndexPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var ok =
        "https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=9bc84be4289759ee4a5067cd8ac0242b/94cad1c8a786c917ec0c7dd0c73d70cf3ac757cf.jpg";
    return Scaffold(
      appBar: AppBar(
        title: Text('Basics Widget'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              print('添加按钮');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Center(
          child: Text('抽屉'),
        ),
      ),

      body: Padding(
          padding: EdgeInsets.all(0.0),
          child: Column(
            children: <Widget>[
              Text(
                '文本样式',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.indigo,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '文本样式',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.indigo,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RaisedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TabView()));
                },
                child: Text("进入Tab测试页"),
              ),
              Image.network(
                ok,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              RaisedButton(
                onPressed: () {
                  print("onPressed");
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OkApp()));
                  ok = "https://s2.ax1x.com/2019/05/27/VZrNNR.png";

                },
                color: Colors.red,
                textColor: Colors.blue,
                child: Image.network(
                    "https://s2.ax1x.com/2019/05/27/VZrNNR.png"),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                     child: Text("将屏幕横向评分两份,我是第一份"),
                      flex: 1,
                    ),
                    Expanded(
                      child: Text("将屏幕横向评分两份,我是第二份"),
                      flex: 2,
                    ),
                    Container(
                      child: Column(),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}