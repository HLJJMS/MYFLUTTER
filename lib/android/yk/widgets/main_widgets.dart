import 'package:flutter/material.dart';

import '../ykRouter.dart';

class WidgetsMainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Widgets 目录'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '基础组件',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      '一个拥有绘制、定位、调整大小的 widget。',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black38,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      '查看',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                color: Colors.teal[50],
              ),
              onTap: () {
                Navigator.pushNamed(context, ROUTES_COMMON_WIDGETS_MAIN_VIEW);
              },
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Text('Material Components'),
              color: Colors.teal[100],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Text('Cupertino (iOS风格) Widgets'),
              color: Colors.teal[200],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Text('Layout'),
              color: Colors.teal[300],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Text('Text'),
              color: Colors.teal[400],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Text('Assets、Images、Icon'),
              color: Colors.teal[500],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Text('Input'),
              color: Colors.teal[600],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Text('动画&Motion'),
              color: Colors.teal[700],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Text('交互模型'),
              color: Colors.teal[800],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Text('样式'),
              color: Colors.teal[900],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Text('绘制和效果'),
              color: Colors.green[50],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Text('Async'),
              color: Colors.green[100],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Text('滚动'),
              color: Colors.green[200],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Text('辅助功能'),
              color: Colors.green[300],
            ),
          ],
        ),
      ),
    );
  }
}
