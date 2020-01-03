import 'package:flutter/material.dart';

class AnimDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _animDemoPageState();
  }
}

class _animDemoPageState extends State<AnimDemoPage> with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    // 创建AnimationController对象，设置动画时间为300毫秒
    controller = AnimationController(
      lowerBound: 0,
      upperBound: 1,
      duration: Duration(milliseconds: 300),
      vsync: this
    );
    // 创建Tween对象，设置起始值为0，结束值为300，并创建Animation对象
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    // 添加值变化的监听
    animation.addListener((){
      // 刷新界面
      setState(() {
        
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("补间动画练习"),
      ),
      body: Column(
        children: <Widget>[
          // 将尺寸值设置为动画对象的值
          FlutterLogo(size: animation.value),
          RaisedButton(
            child: Text("动画"),
            onPressed: () {
              // 开始执行动画
              controller.forward();
            },
          )
        ],
      ),
    );
  }
}