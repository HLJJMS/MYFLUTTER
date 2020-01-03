import 'package:flutter/material.dart';
import 'package:flutter_app/util/routerUtil.dart';

class AnimationListScreen extends StatefulWidget {
  AnimationListScreen({Key key}) : super(key: key);

  _AnimationListScreenState createState() => _AnimationListScreenState();
}

class _AnimationListScreenState extends State<AnimationListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画列表'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Center(
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("补间动画"),
                  onPressed: () {
                    // Navigator.pushNamed(context, "lc/tabbar/demo1");
                    RouterUtil.navigateTo(context, "lc/animatable/tween");
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Center(
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("曲线动画"),
                  onPressed: () {
                    // Navigator.pushNamed(context, "lc/tabbar/demo1");
                    RouterUtil.navigateTo(context, "lc/animatable/curved");
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Center(
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("builder重构动画"),
                  onPressed: () {
                    // Navigator.pushNamed(context, "lc/tabbar/demo1");
                    RouterUtil.navigateTo(context, "lc/animatable/builder");
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Center(
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("hero动画1"),
                  onPressed: () {
                    // Navigator.pushNamed(context, "lc/news/one");
                    // Navigator.of(context).pushNamed("/");
                    RouterUtil.navigateTo(context, "/lc/animatable/hero1");
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Center(
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("hero动画2"),
                  onPressed: () {
                    // Navigator.pushNamed(context, "lc/news/one");
                    // Navigator.of(context).pushNamed("/");
                    RouterUtil.navigateTo(context, "/lc/animatable/hero2");
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Center(
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("交错动画"),
                  onPressed: () {
                    // Navigator.pushNamed(context, "lc/news/one");
                    // Navigator.of(context).pushNamed("/");
                    RouterUtil.navigateTo(context, "/lc/animatable/stagger");
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Center(
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("导航线动画"),
                  onPressed: () {
                    // Navigator.pushNamed(context, "lc/news/one");
                    // Navigator.of(context).pushNamed("/");
                    RouterUtil.navigateTo(context, "/lc/animatable/tabLine");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
