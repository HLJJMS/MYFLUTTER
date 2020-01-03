import 'package:flutter/material.dart';

class YdFourScreen extends StatefulWidget {
  YdFourScreen({Key key}) : super(key: key);

  @override
  _YdFourScreenState createState() => _YdFourScreenState();
}

class _YdFourScreenState extends State<YdFourScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint('我的 initstate.....');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('我的 build.....');
    return Container(
      color: Colors.orange,
      child: Center(
        child: Text('我的', style: TextStyle(fontSize: 36, color: Colors.white)),
      ),
    );
  }
}
