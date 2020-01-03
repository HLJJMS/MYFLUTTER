import 'package:flutter/material.dart';

class ListenerScreen extends StatefulWidget {
  ListenerScreen({Key key}) : super(key: key);

  @override
  _ListenerScreenState createState() => _ListenerScreenState();
}

class _ListenerScreenState extends State<ListenerScreen> {
  var _opName = "未检测到操作";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listener原始指针事件'),
      ),
      body: Center(
        child: Listener(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 240,
            height: 120,
            child: Text(
              _opName,
              style: TextStyle(color: Colors.white),
            ),
          ),
          onPointerDown: (PointerDownEvent event) =>
              _showEventText('onPointerDown'),
          onPointerMove: (PointerMoveEvent event) =>
              _showEventText('onPointerMove'),
          onPointerUp: (PointerUpEvent event) => _showEventText('onPointerUp'),
          onPointerCancel: (PointerCancelEvent event) =>
              _showEventText('onPointerCancel'),
        ),
      ),
    );
  }

  void _showEventText(String text) {
    setState(() {
      _opName = text;
    });
    print(_opName);
  }
}
