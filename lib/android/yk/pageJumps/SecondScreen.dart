import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('第二页'),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text('返回第二页'),
          onPressed: () {
            Navigator.pop(context);
          }
        ),
      ),
    );
  }
}