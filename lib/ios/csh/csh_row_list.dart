import 'package:flutter/material.dart';
import 'package:flutter_app/tool/data_helper.dart';
import 'package:flutter_app/tool/color_helper.dart';
import 'package:flutter_app/tool/scction_head_helper.dart';

class CSHRowList extends StatefulWidget {
  @override
  _CSHListState createState() => _CSHListState();
}

class _CSHListState extends State<CSHRowList> {
  ScrollController _listScrollC = ScrollController();
  SHSectionHeadConfig config = SHSectionHeadConfig();

  @override
  void initState() {
    super.initState();

    //初始化model
    for (var i = 0; i < 4; i++) {
      config.keyList.add(GlobalKey());
    }
    config.position = 0.0;
    config.scrollDirection = Axis.horizontal;

    _listScrollC.addListener(() {
      if (config.handleData()) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('行悬浮'),
        ),
        body: Stack(
          children: <Widget>[
            SafeArea(
              child: ListView.builder(
                scrollDirection: config.scrollDirection,
                controller: _listScrollC,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 1) {
                    return getHeadView(0, true);
                  }

                  if (index == 9) {
                    return getHeadView(1, true);
                  }

                  if (index == 20) {
                    return getHeadView(2, true);
                  }

                  if (index == 30) {
                    return getHeadView(3, true);
                  }
                  return Container(
                    color: Colors.red,
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
            ),
            handleHead(),
          ],
        ));
  }

  /// MARK:处理悬浮头部
  //  @LastEditors: 陈胜辉
  //  @Version: 版本号, YYYY-MM-DD
  //  @param {type}
  //  @return:
  //  @Deprecated: 否
  //  备注
  Widget handleHead() {
    Widget widget = Container();
    //需要悬浮
    if (config.currentIndex >= 0) {
      widget = Positioned(
        left: config.offset,
        child: getHeadView(config.currentIndex, false),
      );
    }

    return widget;
  }

  /// MARK:获取头部组件
  //  @LastEditors: 陈胜辉
  //  @Version: 版本号, YYYY-MM-DD
  //  @param {type}
  //  @return:
  //  @Deprecated: 否
  //  备注
  Widget getHeadView(int index, bool isKey) {
    return Container(
      key: isKey ? config.keyList[index] : null,
      height: CommonData.viewSafeH - 12,
      color: isKey ? randomColor() : Colors.cyan,
      alignment: Alignment.center,
      child: Text(
        '我是头部 === $index',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
