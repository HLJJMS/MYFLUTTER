import 'package:flutter/material.dart';

class UIMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("第一页"),
      ),
      body:
      GridView.count(
        crossAxisCount: 3, //一行的 Widget 数量
        children: <Widget>[
          GestureDetector(
            child: Image.asset('assets/image/icon_grid_button.png'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          Text('这是一个文本'),
          Text('这是一个文本'),
          Text('这是一个文本'),
          Text('这是一个文本'),
          Text('这是一个文本'),
          Text('这是一个文本'),
          Text('这是一个文本'),
          Text('这是一个文本'),
          Text('这是一个文本'),
          Text('这是一个文本'),
          Text('这是一个文本'),
          Text('这是一个文本'),
          Text('这是一个文本'),
          Text('这是一个文本')
        ],
      ),
    );
  }
}
