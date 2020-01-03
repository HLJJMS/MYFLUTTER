/* MARK: 底部导航栏组件
 * @Description: 类描述
 * @Author: 刘驰
 * @Date: 2019-12-01 15:19:03
 * @Version: 版本号, YYYY-MM-DD
 * @LastEditors: 刘驰
 * @LastEditTime: 2019-12-02 15:01:08
 * @Deprecated: 否
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Demo.dart';
import 'package:flutter_app/android/androidDemo.dart';
import 'package:flutter_app/ios/IosDemo.dart';
import 'package:flutter_app/ios/adamF/myViewController.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomNavigationWidgetSate();
  }
}

class _BottomNavigationWidgetSate extends State<BottomNavigationWidget> {
  final _bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> pages = List<Widget>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages.addAll([
      Demo(),
      AndroidDemo(),
      MyViewController(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // 苹果风格底部导航
      bottomNavigationBar: CupertinoTabBar(
          border: Border(top: BorderSide(width: 1, color: Colors.grey[200])),
          backgroundColor: Colors.white,
          activeColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 25,
                ),
                title: Text("首页")),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/image/bottom_navigation_bar_loan.png'),
                  size: 25,
                ),
                title: Text("安卓")),
            BottomNavigationBarItem(
                icon: ImageIcon(
                    AssetImage('assets/image/bottom_navigation_bar_mine.png'),
                    size: 25),
                title: Text("苹果")),
          ],
          currentIndex: _currentIndex,
          onTap: (int i) {
            setState(() {
              _currentIndex = i;
            });
          }),
      body: pages[_currentIndex],
    );
  }
}
