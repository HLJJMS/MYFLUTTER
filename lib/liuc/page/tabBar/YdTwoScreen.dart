import 'package:flutter/material.dart';

class YdTwoScreen extends StatefulWidget {
  YdTwoScreen({Key key}) : super(key: key);

  @override
  _YdTwoScreenState createState() => _YdTwoScreenState();
}

class _YdTwoScreenState extends State<YdTwoScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint('投资 initstate.....');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('投资 build.....');
    return Container(
      color: Colors.purple,
      child: Center(
        child: Text('投资', style: TextStyle(fontSize: 36, color: Colors.white)),
      ),
    );
  }
}
