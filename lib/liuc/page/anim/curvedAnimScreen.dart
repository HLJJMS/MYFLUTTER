import 'package:flutter/material.dart';

class CurvedAnimScreen extends StatefulWidget {
  CurvedAnimScreen({Key key}) : super(key: key);

  _CurvedAnimScreenState createState() => _CurvedAnimScreenState();
}

class _CurvedAnimScreenState extends State<CurvedAnimScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn)
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
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimateLogo(animation: animation);
  }
}

class AnimateLogo extends AnimatedWidget {
  final _opacityTween = Tween<double>(begin: 0.1, end: 1.0);
  final _sizeTween = Tween<double>(begin: 0.0, end: 300.0);

  AnimateLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Scaffold(
      appBar: AppBar(
        title: Text('曲线动画'),
      ),
      body: Center(
        child: Opacity(
          opacity: _opacityTween.evaluate(animation),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: _sizeTween.evaluate(animation),
            width: _sizeTween.evaluate(animation),
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}
