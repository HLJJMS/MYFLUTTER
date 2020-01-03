import 'package:flutter/material.dart';
import 'package:flutter_app/ios/adamF/home.dart';
import 'package:flutter_app/ios/adamF/money.dart';
import 'package:flutter_app/ios/adamF/my.dart';

class Tabbar extends StatefulWidget {
  final int currentIndex;
  Tabbar({Key key, this.currentIndex}) : super(key: key);

  @override
  _TabbarState createState() =>
      _TabbarState(currentIndex: this.currentIndex ?? 0);
}

class _TabbarState extends State<Tabbar> {
  int currentIndex;
  _TabbarState({this.currentIndex});

  List _pageList = [
    homePage(),
    moneyPage(),
    myPage(),
  ];

  List _title = [
    "首页",
    "借钱",
    "我的",
  ];

  @override
  Widget build(BuildContext context) {
    return comtomTabbar();
  }

  Widget comtomTabbar() {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("首页"), //this._pageList[this._currentIndex]
      // ),
      body: this._pageList[this.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("首页"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money_off),
            title: Text("借钱"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("我的"),
          ),
        ],
        currentIndex: this.currentIndex,
        onTap: (int index) {
          setState(() {
            this.currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
