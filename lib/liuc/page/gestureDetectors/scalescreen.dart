import 'package:flutter/material.dart';

class ScaleScreen extends StatefulWidget {
  ScaleScreen({Key key}) : super(key: key);

  @override
  _ScaleScreenState createState() => _ScaleScreenState();
}

class _ScaleScreenState extends State<ScaleScreen> {
  double _size = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('缩放识别'),
      ),
      body: Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            child: FlutterLogo(size: _size),
          ),
          onScaleUpdate: (ScaleUpdateDetails e) {
            setState(() {
              _size = 300 * e.scale.clamp(0.5, 1.0);
            });
          },
        ),
      ),
    );
  }
}
