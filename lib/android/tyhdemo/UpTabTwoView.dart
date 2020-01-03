import 'package:flutter/material.dart';
import 'package:flutter_app/android/tyhdemo/tool/tabs.dart';
import 'package:flutter_app/android/tyhdemo/tool/tabs_noshake.dart';

class UpTabTwoView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UpTabTwoView();
  }
}

class _UpTabTwoView extends State<UpTabTwoView> with TickerProviderStateMixin {
//  第一个行tab的TabController
  TabController _tabControllerOne;

//  第二行tab的TabController
  TabController _tabControllerTwo;

//  第一行tab的文字集合
  List<String> list = [
    "我问问",
    "啊啊啊",
    "是是是",
    "对对对",
    "发发发",
    "各干各",
    "哈哈哈",
    "急急急",
  ];

//  第二行tab 的文字集合
  List<Widget> listTwo = new List();

//  将所有的变量赋值
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    listTwo.add(new Container(
      alignment: Alignment.center,
      child: new Text(
        "第一个",
      ),
      padding: EdgeInsets.all(10),
    ));
    listTwo.add(new Container(
      alignment: Alignment.center,
      child: new Text(
        "第儿个",
      ),
      padding: EdgeInsets.all(10),
    ));
    _tabControllerOne = new TabController(length: list.length, vsync: this);
    _tabControllerTwo = new TabController(length: listTwo.length, vsync: this);
  }

  @override
  void dispose() {
    _tabControllerOne.dispose();
    _tabControllerTwo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("带嵌套的TAB"),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
//          第一个etabbar开始于普通都一样
              H_TabBar(
                tabs: list.map((text) => H_Tab(text: text)).toList(),
                controller: _tabControllerOne,
                labelColor: Colors.deepPurple,
                unselectedLabelColor: Colors.redAccent,
                unselectedLabelStyle: TextStyle(fontSize: 10),
                //未选中的样式
                labelStyle: TextStyle(fontSize: 16),
                //选中的样式
                isScrollable: true,
              ),
              Expanded(
                child: ExtendedTabBarView(
//            这里面所有的Widget都隶属于第一个tab下面的，并且总数一定要对上，
                  children: <Widget>[
                    new Column(
                      children: <Widget>[
                        new TabBar(
                          tabs: listTwo,
                          labelColor: Colors.deepOrangeAccent,
                          controller: _tabControllerTwo,
                        ),
                        Expanded(
                          child: new ExtendedTabBarView(
                            children: <Widget>[
                              new Text("我是主页"),
                              new Text("我是辅助")
                            ],
                            controller: _tabControllerTwo,
                          ),
                        )
                      ],
                    ),
                    new Container(
                      alignment: Alignment.center,
                      child: new Text(
                        "第一个",
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                    new Container(
                      alignment: Alignment.center,
                      child: new Text(
                        "第2个",
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                    new Container(
                      alignment: Alignment.center,
                      child: new Text(
                        "3",
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                    new Container(
                      alignment: Alignment.center,
                      child: new Text(
                        "4",
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                    new Container(
                      alignment: Alignment.center,
                      child: new Text(
                        "5",
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                    new Container(
                      alignment: Alignment.center,
                      child: new Text(
                        "6",
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                    new Container(
                      alignment: Alignment.center,
                      child: new Text(
                        "7",
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                  ],
                  controller: _tabControllerOne,
                ),
              )
            ],
          ),
        ));
  }
}
