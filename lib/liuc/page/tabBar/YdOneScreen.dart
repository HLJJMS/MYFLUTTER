import 'package:flutter/material.dart';

class YdOneScreen extends StatefulWidget {
  YdOneScreen({Key key}) : super(key: key);

  @override
  _YdOneScreenState createState() => _YdOneScreenState();
}

class _YdOneScreenState extends State<YdOneScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint('首页 initstate.....');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('首页 build.....');
    return Container(
      color: Colors.teal,
      child: Center(
        child: Text('首页', style: TextStyle(fontSize: 36, color: Colors.white)),
      ),
    );
  }
}
