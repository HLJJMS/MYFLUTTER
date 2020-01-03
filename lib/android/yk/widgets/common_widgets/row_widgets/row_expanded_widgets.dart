import 'package:flutter/material.dart';

class RowExpandedView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RowExpandedViewState();
  }
}

class _RowExpandedViewState extends State {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Expanded'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.grey[200],
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text('''
扩展Row、Column或Flex的子空间，填满其可用的空间。
使用Expanded在Row、Column或Flex内生成一个子部件，沿主轴填充可用空间(例如，水平方向为行或垂直于列)。
            '''),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Text(
                '''
故障排除
为什么我的一行有黄色和黑色警告条纹？
如果行的非灵活内容(未包装的内容)，在一起比行本身更宽，那么该行就被称为溢出。
当行溢出时，该行通过在溢出的边缘绘制一个黄色和黑色条纹警告框来报告这一点。
如果行外有空间，溢出量将以红色字体打印。
              ''',
              ),
              Image.asset('assets/image/row_error.png'),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text('修复方法是将第二个子对象封装在扩大小部件，它告诉行应该给子部件留出剩余的空间：'),
              Container(
                padding: EdgeInsets.all(5),
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    const FlutterLogo(),
                    const Expanded(
                      child: Text(
                          'Flutter\'s hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.'),
                    ),
                    const Icon(Icons.sentiment_very_satisfied),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Text('flex: 1'),
                      color: Colors.red[900],
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(
                      child: Text('flex: 3'),
                      color: Colors.red[700],
                    ),
                    flex: 3,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Text('flex: 1'),
                      color: Colors.red[500],
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(
                      child: Text('flex: 1'),
                      color: Colors.red[300],
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(
                      child: Text('flex: 2'),
                      color: Colors.red[100],
                    ),
                    flex: 2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
