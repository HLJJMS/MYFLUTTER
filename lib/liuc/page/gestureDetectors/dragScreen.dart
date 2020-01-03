import 'package:flutter/material.dart';

class DragScreen extends StatefulWidget {
  DragScreen({Key key}) : super(key: key);

  @override
  _DragScreenState createState() => _DragScreenState();
}

class _DragScreenState extends State<DragScreen>
    with SingleTickerProviderStateMixin {
  double _top = 0.0;
  double _left = 0.0;
  double _size = 100.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('拖拽控件'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: FlutterLogo(size: _size),
              onPanUpdate: (e) {
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
