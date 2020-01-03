import 'package:flutter/material.dart';

class TweenAnimScreen extends StatefulWidget {
  final String title;
  TweenAnimScreen({Key key, this.title}) : super(key: key);

  _TweenAnimScreenState createState() => _TweenAnimScreenState();
}

class _TweenAnimScreenState extends State<TweenAnimScreen> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: 2000),vsync: this);
    animation = Tween(begin: 0.0, end: 300.0).animate(controller)
    ..addListener((){
      setState(() {
        print(animation.value);
      });
    })
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // controller.reverse();
      }else if(status == AnimationStatus.dismissed) {
        // controller.forward();
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('补间动画1'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}