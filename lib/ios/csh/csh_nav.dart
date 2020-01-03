import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/extension/sh_extension_string.dart';
import 'package:flutter_app/extension/sh_extension_color.dart';
import 'package:flutter_app/tool/data_helper.dart';
import 'package:flutter_app/util/routerUtil.dart';
import 'dart:ui';
import 'package:flutter_app/util/toastUtil.dart';
import 'package:flutter_app/util/custom_widget.dart';

class CSHNav extends StatefulWidget {
  @override
  _CSHNavState createState() => _CSHNavState();
}

class _CSHNavState extends State<CSHNav> {
  double scrollY = 0;
  ScrollController _listScrollC = ScrollController();
  GlobalKey _headKey = GlobalKey();

  int headtIndex = null;

  @override
  void initState() {
    super.initState();
    _listScrollC.addListener(() {
      print('=== ${_listScrollC.position.pixels}');

      RenderBox renderBox = _headKey.currentContext.findRenderObject();
      var offset =
          renderBox.localToGlobal(Offset(0.0, -CommonData.navAndStatusH));
      print('我是4个 == ${offset.dy}');

      if (offset.dy <= _listScrollC.position.pixels &&
          offset.dy > renderBox.size.height) {
        print('我悬浮！！！！！');
      }

      setState(() {
        scrollY = _listScrollC.position.pixels;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _configUI(context);
  }

  Widget _configUI(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        dialogBackgroundColor: Colors.transparent,
        cursorColor: Colors.transparent,
        accentColor: Colors.transparent,
      ),
      child: Scaffold(
        body:
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: <Widget>[
            //     _configAppBar(),
            //     Expanded(
            //       child: _configBody(),
            //     ),
            //   ],
            // ),
            Stack(
          children: <Widget>[
            SafeArea(
              top: true,
              bottom: false,
              child: Container(
                margin: EdgeInsets.only(top: CommonData.navH),
                child: _configBody(),
              ),
            ),
            // configBody(),
            Container(
              // margin: EdgeInsets.only(top: CommonData.statusH),
              child: _configAppBar(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _configBody() {
    return Container(
      color: Colors.red,
      child: ListView.builder(
        controller: _listScrollC,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            key: (index == 4) ? _headKey : null,
            color: (index == 4) ? Colors.cyan : null,
            alignment: Alignment.center,
            child: Text(
              '我是第 --- $index',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          );
        },
        itemCount: 50,
      ),
    );
  }

  Widget _configAppBar() {
    double opacity = (scrollY / 44);

    return CustomNav(
      opacity: opacity,
      middleText: '我是导航栏',
      // height: CommonData.navH,
      // middle: Container(
      //   alignment: Alignment.center,
      //   child: Text(
      //     '我是自定义导航栏',
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontSize: 18,
      //     ),
      //   ),
      // ),
      // actionsMaxW: 0,
      // leftActions: [
      //   CupertinoButton(
      //     pressedOpacity: 0.5,
      //     padding: EdgeInsets.only(left: 0),
      //     child: Icon(
      //       CupertinoIcons.back,
      //       size: 25,
      //       color: Colors.white,
      //     ),
      //     onPressed: () {
      //       RouterUtil.pop(context);
      //     },
      //   ),
      //   CupertinoButton(
      //     pressedOpacity: 0.5,
      //     padding: EdgeInsets.only(left: 0),
      //     child: Icon(
      //       CupertinoIcons.refresh,
      //       size: 30,
      //       color: Colors.white,
      //     ),
      //     onPressed: () {
      //       showToast('点击了刷新');
      //     },
      //   ),
      // ],
      // rightActions: [
      //   CupertinoButton(
      //     padding: EdgeInsets.only(left: 0),
      //     child: Icon(
      //       Icons.share,
      //       size: 20,
      //       color: Colors.white,
      //     ),
      //     onPressed: () {
      //       showToast('点击了分享');
      //     },
      //   ),
      //   CupertinoButton(
      //     padding: EdgeInsets.only(left: 0),
      //     child: Icon(
      //       Icons.more_horiz,
      //       size: 25,
      //       color: Colors.white,
      //     ),
      //     onPressed: () {
      //       showToast('点击了更多');
      //     },
      //   ),
      // ],
      // background: Container(
      //   decoration: const BoxDecoration(
      //     gradient: LinearGradient(
      //       colors: [Colors.amberAccent, Colors.lightBlue, Colors.red],
      //     ),
      //   ),
      // ),
      // background: Image.asset(
      //   "assets/image/bg.png",
      //   fit: BoxFit.cover,
      // ),
      // backgroundColor: '#66365AF7'.toColor(),
    );
  }
}
