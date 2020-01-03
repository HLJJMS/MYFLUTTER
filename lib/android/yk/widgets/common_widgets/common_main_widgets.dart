import 'package:flutter/material.dart';

import '../../ykRouter.dart';

class CommonWidgetsMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('基础 Widgets'),
      ),
      body: GridView.count(
        primary: false,
        padding: EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: <Widget>[
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Text('Container'),
                  Text(
                    '一个拥有绘制、定位、调整大小的 widget。',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
              color: Colors.teal[50],
            ),
            onTap: () {
              Navigator.pushNamed(
                  context, ROUTES_COMMON_WIDGETS_CONTAINER_VIEW);
            },
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Text('Row'),
                  Text(
                    '在水平方向上排列子widget的列表。',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
              color: Colors.teal[100],
            ),
            onTap: () {
              Navigator.pushNamed(context, ROUTES_COMMON_WIDGETS_ROW_VIEW);
            },
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Text('Column'),
                  Text(
                    '在垂直方向上排列子widget的列表。',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
              color: Colors.teal[200],
            ),
            onTap: () {
              Navigator.pushNamed(context, ROUTES_COMMON_WIDGETS_COLUMN_VIEW);
            },
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Text('Image'),
                  Text(
                    '一个显示图片的widget',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
              color: Colors.teal[300],
            ),
            onTap: () {
              Navigator.pushNamed(context, ROUTES_COMMON_WIDGETS_IMAGE_VIEW);
            },
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Text('Text'),
                  Text(
                    '单一格式的文本',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
              color: Colors.teal[400],
            ),
            onTap: () {},
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Text('Icon'),
                  Text(
                    'A Material Design icon.',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
              color: Colors.teal[500],
            ),
            onTap: () {},
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Text('RaisedButton'),
                  Text(
                    'Material Design中的button， 一个凸起的材质矩形按钮',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
              color: Colors.teal[600],
            ),
            onTap: () {},
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Text('Scaffold'),
                  Text(
                    'Material Design布局结构的基本实现。此类提供了用于显示drawer、snackbar和底部sheet的API。',
                    style: TextStyle(fontSize: 8),
                  ),
                ],
              ),
              color: Colors.teal[700],
            ),
            onTap: () {},
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Text('Appbar'),
                  Text(
                    '一个Material Design应用程序栏，由工具栏和其他可能的widget（如TabBar和FlexibleSpaceBar）组成。',
                    style: TextStyle(fontSize: 8),
                  ),
                ],
              ),
              color: Colors.teal[800],
            ),
            onTap: () {},
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Text('FlutterLogo'),
                  Text(
                    'Flutter logo, 以widget形式. 这个widget遵从IconTheme。',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
              color: Colors.teal[900],
            ),
            onTap: () {},
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Text('Placeholder'),
                  Text(
                    '一个绘制了一个盒子的的widget，代表日后有widget将会被添加到该盒子中',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
              color: Colors.green[50],
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
