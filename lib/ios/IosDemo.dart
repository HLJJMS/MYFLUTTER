import 'package:flutter/material.dart';
import 'package:flutter_app/base/Tabbar.dart';

class IosDemo extends StatefulWidget {
  final int currentIndex;
  IosDemo({
    Key key,
    this.currentIndex,
  }) : super(key: key);

  @override
  _IosDemoState createState() => _IosDemoState(currentIndex: currentIndex);
}

class _IosDemoState extends State<IosDemo> {
  final int currentIndex;
  _IosDemoState({
    this.currentIndex,
  });
  @override
  Widget build(BuildContext context) {
    return Tabbar(
      currentIndex: currentIndex,
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("我的"),
    //   ),
    //   body: Container(
    //     width: double.infinity,
    //     height: double.infinity,
    //     color: Colors.yellow,
    //     child: Text("wode "),
    //   ),
    // );
  }
}
