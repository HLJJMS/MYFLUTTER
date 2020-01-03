import 'package:flutter/material.dart';
import 'package:flutter_app/liuc/component/growTransition.dart';
import 'package:flutter_app/liuc/component/logoWidget.dart';

class AnimatedBuilderScreen extends StatefulWidget {
  final String title;

  AnimatedBuilderScreen({Key key, this.title}) : super(key: key);

  @override
  _AnimatedBuilderScreenState createState() => _AnimatedBuilderScreenState();
}

class _AnimatedBuilderScreenState extends State<AnimatedBuilderScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    final CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation = Tween(begin: 0.0, end: 300.0).animate(curve)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('builder重构'),
      ),
      body: GrowTransition(child: LogoWidget(), animation: animation),
    );
  }
}
