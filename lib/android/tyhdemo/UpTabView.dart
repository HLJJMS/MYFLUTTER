import 'package:flutter/material.dart';
import 'package:flutter_app/android/tyhdemo/tool/tabs_noshake.dart';

class UpTabView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UpTabView();
  }
}

class _UpTabView extends State<UpTabView> with SingleTickerProviderStateMixin {
  List<Widget> list = [
    new Text("哈哈哈"),
    new Text("哈哈哈"),
    new Text("哈哈哈"),
    new Text("哈哈哈"),
    new Text("哈哈哈"),
    new Text("哈哈哈"),
  ];
  List<String> listTxt = ["三大", "维权", "二位", "驱蚊器", "是是是", "嗯嗯嗯柔柔弱弱若若若若若若"];

//  List<Widget> listTwo = new List();
  TabController controller; //tab控制器
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

//    list.add( new Text(
//        "第1个",
//        softWrap: false, overflow: TextOverflow.fade
//    ),);
//    list.add( new Text(
//        "第2个",
//        softWrap: false, overflow: TextOverflow.fade
//    ),);
//    list.add( new Text(
//        "第3个",
//        softWrap: false, overflow: TextOverflow.fade
//    ),);
//    list.add( new Text(
//        "第4个",
//        softWrap: false, overflow: TextOverflow.fade
//    ),);
//    list.add( new Text(
//        "第5个",
//        softWrap: false, overflow: TextOverflow.fade
//    ),);
//    list.add( new Text(
//        "第6个",
//        softWrap: false, overflow: TextOverflow.fade
//    ),);

//    listTwo.add(value)
    controller = new TabController(length: list.length, vsync: this);
    controller.addListener(() {
      print("动画值：${controller.animation.value}     翻页值：${controller.index}");
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text("titleBar测试"),
      ),
      body: new Container(
        child: new Column(
//          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _getTabOne(),
            _getTabView(),
          ],
        ),
      ),
    );
  }

  Widget _getTabOne() {
    return new H_TabBar(
      //选中的颜色
      labelColor: Colors.deepPurple,
      //选中的样式
      labelStyle: TextStyle(fontSize: 16),
      //未选中的颜色
      unselectedLabelColor: Colors.redAccent,
      //未选中的样式
      unselectedLabelStyle: TextStyle(fontSize: 10),
      //下划线颜色
      indicatorColor: Colors.amberAccent,
      //是否可滑动
      isScrollable: true,
      //  设置item
      tabs: listTxt.map((text) => H_Tab(text: text)).toList(),
      labelPadding: EdgeInsets.all(50),
      controller: controller,
    );
  }

  Widget _getTabView() {
    return new Expanded(
      child: new H_TabBarView(
        children: list,
        controller: controller,
        //color: Colors.amber,
      ),
    );
  }

//
//  Widget _getTabViewChild() {
//    return new Expanded(
//      child: Column(
//        children: <Widget>[
//          new TabBar(
//            labelColor: Colors.deepPurple,
//            //选中的颜色
//            labelStyle: TextStyle(fontSize: 16),
//            //选中的样式
//            unselectedLabelColor: Colors.redAccent,
//            //未选中的颜色
//            unselectedLabelStyle: TextStyle(fontSize: 14),
//            //未选中的样式
//            indicatorColor: Colors.amberAccent,
//            //下划线颜色
//            isScrollable: true,
//            //是否可滑动
//            tabs: list,
//            controller: controller,
//          ),
//        new Expanded(child: new TabBarView(children: listTwo,controller: ,))
//
//        ],
//
//      ),);
//  }
}
