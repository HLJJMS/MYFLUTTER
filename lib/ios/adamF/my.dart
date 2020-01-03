import 'package:flutter/material.dart';

class myPage extends StatelessWidget {
  const myPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"), //this._pageList[this._currentIndex]
      ),
      body: Text("data"),
    );
  }
}
