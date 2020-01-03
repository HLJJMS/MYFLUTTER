
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:convert/convert.dart';
import 'dart:convert'as Convert ;
import 'package:flutter/painting.dart';
class AnimationTest extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListViewWidget();
  }

}
class ListViewWidget extends State<AnimationTest> with TickerProviderStateMixin{
  AnimationController controller;
  Animation animation;
  CurvedAnimation  curvedAnimation;

  @override
  void initState() {
    controller=AnimationController(duration: Duration(milliseconds: 1000),vsync: this);
    animation=Tween(begin: 0.0,end: 10.0).animate(controller);
    animation.addStatusListener((status){
      if (status==AnimationStatus.completed){
        controller.reverse();
      }else if (status==AnimationStatus.dismissed){
        controller.forward();
      }
    });
    curvedAnimation=CurvedAnimation(parent: controller,curve:Curves.fastOutSlowIn);
    curvedAnimation.addStatusListener((status){
      if (status==AnimationStatus.completed){
        controller.reverse();
      }else if (status==AnimationStatus.dismissed){
        controller.forward();
      }
    });
    controller.forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("测试动画页面"),centerTitle: true,),
                body: Stack(children: <Widget>[
                  ListView(
                    children: <Widget>[
                      FlutterLogo(size: 100,),
                      Row(children: <Widget>[
                        Expanded(child: ScaleTransition(scale: animation, child: FlutterLogo(size: 100,),),flex: 1,),
                        Expanded(child: RotationTransition(turns: animation, child: FlutterLogo(size: 100,),),flex: 1,),
                      ],),
                      Row(children: <Widget>[
                        Expanded(child: Transform.translate(offset:Offset(100.0*curvedAnimation.value,0.0),child: FlutterLogo(size: 100,),),flex: 1,),
                        Expanded(child: Transform.rotate(angle: curvedAnimation.value* 3.14 , child: FlutterLogo(size: 100,),),flex: 1,),
                      ],)
                  ],)

                ],),

    );

  }
    @override
  void dispose() {
      controller=null;
    super.dispose();
  }
}



