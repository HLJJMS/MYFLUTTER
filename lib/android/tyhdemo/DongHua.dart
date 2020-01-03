import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class DongHua extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DongHuaState();
  }
}

class _DongHuaState extends State<DongHua> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: Duration(milliseconds: 5000), vsync: this);

    animation = new Tween(begin: 0.0, end: 500.0).animate(controller)
      ..addListener(() {
//      if (status == AnimationStatus.completed) {
//        //动画从 controller.reverse() 反向执行 结束时会回调此方法
//        print("status is completed");
//      } else if (status == AnimationStatus.dismissed) {
//        //动画从 controller.forward() 正向执行 结束时会回调此方法
//        print("status is dismissed");
//      }else if (status == AnimationStatus.forward) {
//        print("status is forward");
//        //执行 controller.forward() 会回调此状态
//      }else if (status == AnimationStatus.reverse) {
//        //执行 controller.reverse() 会回调此状态
//        print("status is reverse");
//      }
        setState(() {
          print(animation.value);
        });
      });
    animation.addStatusListener((listener) {
      if (listener == AnimationStatus.completed) {
        controller.reverse();
      } else if (listener == AnimationStatus.dismissed) {
        controller.forward();
      }
    });


    controller.forward();
//    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          new RotationTransition(turns: controller,
            child: new Opacity(
              opacity: animation.value / 500.0,
//             child: Transform(
//              transform:
              child: new FlutterLogo(
                size: animation.value,
              ),
//             ),
            ),
          )
        ],
      ),
      padding: EdgeInsets.fromLTRB(20, animation.value, 20, 0),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
