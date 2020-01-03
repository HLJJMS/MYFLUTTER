import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lottie/flutter_lottie.dart';
// import 'package:flutter_lottie/flutter_lottie.dart';

class MeiQia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MeiQia();
  }
}

class _MeiQia extends State<MeiQia> {
  static const platform = const MethodChannel("com.example.flutterApp");

  @override
  void initState() {
    _setMQ();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: <Widget>[
          new FlatButton(
              onPressed: () {
                _goMQTalk();
              },
              child: new Text(
                "点击我美洽开始对话模式",
                style: TextStyle(color: Colors.white),
              ),
              padding: EdgeInsets.fromLTRB(20, 100, 20, 20)),
          new FlatButton(
              onPressed: () {
                _goMQMessage();
              },
              child: new Text(
                "点击我美洽开始留言模式",
                style: TextStyle(color: Colors.white),
              ),
              padding: EdgeInsets.fromLTRB(20, 100, 20, 20)),

          new Container(
            width: 40,
            height: 40,
            color: Colors.white,
            child: LottieView.fromFile(
              filePath: 'assets/jsonplay/faxian.json',
              autoPlay: true,
              loop: true,
              reverse: false,
            ),
          ),
          new Container(
            width: 40,
            height: 40,
            color: Colors.white,
            child: LottieView.fromFile(
              filePath: 'assets/jsonplay/faxian.json',
              autoPlay: true,
              loop: true,
              reverse: false,
            ),
          )
        ],
      ),
    );
  }

  Future<Null> _goMQTalk() async {
    await platform.invokeMethod("startTalkMeiQia");
  }

  Future<Null> _goMQMessage() async {
    await platform.invokeMethod("startMessageMeiQia");
  }

  Future<Null> _setMQ() async {
    String message = await platform.invokeMethod("setMeiQia");
    print(message);
  }
}
