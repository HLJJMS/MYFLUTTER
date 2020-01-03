import 'package:flutter/material.dart';
import 'blur_rect_widget.dart';
class DingGaosiPage extends StatefulWidget {
  DingGaosiPage({Key key}) : super(key: key);

  @override
  _DingGaosiPageState createState() => _DingGaosiPageState();
}

class _DingGaosiPageState extends State<DingGaosiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("高斯模糊"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset('images/bggg.jpg',
          fit: BoxFit.cover,),
          Center(
            child: BlurRectWidget(
              Text('啦啦啦' * 60),
              padding: 10,
            ),
          )
        ],
      ),
    );
  }
}