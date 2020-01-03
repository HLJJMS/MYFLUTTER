import 'package:flutter/material.dart';

class GestureDetectorScreen extends StatefulWidget {
  GestureDetectorScreen({Key key}) : super(key: key);

  @override
  _GestureDetectorScreenState createState() => _GestureDetectorScreenState();
}

class _GestureDetectorScreenState extends State<GestureDetectorScreen> {
  String _opName = "未检测到操作";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureDetector手势识别'),
      ),
      body: Center(
        child: GestureDetector(
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
          // onTap: () => _showEventText("Tap"),
          // onTapUp: (e) => _showEventText("TapUp"),
          // onTapDown: (e) => this._showEventText("TapDown"),
          // onTapCancel: () => this._showEventText("TapCancel"),
          // onDoubleTap: () => this._showEventText("DoubleTap"),
          // onLongPress: () => this._showEventText("LongPress"),
          // onVerticalDragStart: (e) => this._showEventText("VerticalDragStart"),
          // onVerticalDragDown: (e) => this._showEventText("VerticalDragDown"),
          // onVerticalDragUpdate: (e) =>
          //     this._showEventText("VerticalDragUpdate"),
          // onVerticalDragEnd: (e) => this._showEventText("VerticalDragEnd"),
          // onVerticalDragCancel: () => this._showEventText("VerticalDragCancel"),
          // onHorizontalDragStart: (e) =>
          //     this._showEventText("HorizontalDragStart"),
          // onHorizontalDragDown: (e) =>
          //     this._showEventText("HorizontalDragDown"),
          // onHorizontalDragUpdate: (e) =>
          //     this._showEventText("HorizontalDragUpdate"),
          // onHorizontalDragEnd: (e) => this._showEventText("HorizontalDragEnd"),
          // onHorizontalDragCancel: () =>
          //     this._showEventText("HorizontalDragCancel"),
          onPanDown: (e) => this._showEventText("PanDown"),
          onPanStart: (e) => this._showEventText("PanStart"),
          onPanUpdate: (e) => this._showEventText("PanUpdate"),
          onPanEnd: (e) => this._showEventText("PanEnd"),
          // onScaleStart: (e) => this._showEventText("ScaleStart"),
          // onScaleUpdate: (e) => this._showEventText("ScaleUpdate"),
          // onScaleEnd: (e) => this._showEventText("ScaleEnd"),
          // onLongPressMoveUpdate: (e) => this._showEventText("text"),
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
