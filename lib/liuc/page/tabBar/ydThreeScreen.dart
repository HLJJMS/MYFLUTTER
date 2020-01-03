import 'package:flutter/material.dart';

class YdThreeScreen extends StatefulWidget {
  YdThreeScreen({Key key}) : super(key: key);

  @override
  _YdThreeScreenState createState() => _YdThreeScreenState();
}

class _YdThreeScreenState extends State<YdThreeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint('发现 initstate.....');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('发现 build.....');
    return Container(
      color: Colors.pink,
      child: Center(
        child: Text('发现', style: TextStyle(fontSize: 36, color: Colors.white)),
      ),
    );
  }
}
