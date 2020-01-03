import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NextViewcontroller extends StatefulWidget {
  NextViewcontroller(first, {Key key}) : super(key: key);

  @override
  _NextViewcontrollerState createState() => _NextViewcontrollerState();
}

class _NextViewcontrollerState extends State<NextViewcontroller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试"),
      ),
      body: TextAdamPage(),
    );
  }
}

class TextAdamPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextAdamPage();
  }
}

class _TextAdamPage extends State<TextAdamPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.yellow,
      width: double.infinity,
      height: double.infinity,
      child: Row(
        // alignment: AlignmentDirectional.topCenter,
        // overflow: Overflow.clip,
        mainAxisAlignment: MainAxisAlignment.start,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          // Text("222229898998"),

          Baseline(
            baseline: 50,
            //alphabetic：对齐字符底部的水平线；
            //ideographic：对齐表意字符的水平线。
            baselineType: TextBaseline.alphabetic,
            child: Text(
              "333333333333",
              style: TextStyle(fontSize: 14),
            ),
          ),
          Baseline(
            baseline: 50,
            //alphabetic：对齐字符底部的水平线；
            //ideographic：对齐表意字符的水平线。
            baselineType: TextBaseline.alphabetic,
            child: Text(
              "国",
              style: TextStyle(fontSize: 50),
            ),
          ),
        ],
      ),
    );
  }
}
