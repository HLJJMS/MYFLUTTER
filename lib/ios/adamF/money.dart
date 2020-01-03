import 'package:flutter/material.dart';

class moneyPage extends StatelessWidget {
  const moneyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("借钱"), //this._pageList[this._currentIndex]
      ),
      body: Text("变换"),
    );
  }
}
