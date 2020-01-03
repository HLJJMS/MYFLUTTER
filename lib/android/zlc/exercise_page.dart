import 'package:flutter/material.dart';
import 'package:flutter_app/android/zlc/MovieFilmListView.dart';
import 'package:flutter_app/android/zlc/fun.dart';

import 'AnimationTest.dart';
import 'MyPaint.dart';

class ExercisePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>ExerciseMainPage();
}
class ExerciseMainPage extends State <ExercisePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("入口页面"),),
      body: Column(
        children: <Widget>[
       Container(
         alignment: Alignment.topCenter,
         child:      MaterialButton(
           child: Text("登录页面"),
           onPressed: (){
             Navigator.pushNamed(context, "zlcLogin");
           },
         ),
       ),
          Container(
            alignment: Alignment.topCenter,
            child:      MaterialButton(
              child: Text("电影列表"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieFilmListView()));
              },
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child:      MaterialButton(
              child: Text("动画测试"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AnimationTest()));
              },
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child:      MaterialButton(
              child: Text("一些功能实现"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> FunPage()));
              },
            ),
          )
        ],
      ),
    );
  }

}