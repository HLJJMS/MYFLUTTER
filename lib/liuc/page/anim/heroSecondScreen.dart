import 'package:flutter/material.dart';
import 'package:flutter_app/liuc/component/customLogoWidget.dart';

class HeroSecondScreen extends StatefulWidget {
  HeroSecondScreen({Key key}) : super(key: key);

  @override
  _HeroSecondScreenState createState() => _HeroSecondScreenState();
}

class _HeroSecondScreenState extends State<HeroSecondScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint("hero2");
    return Scaffold(
      body: Center(
        child: Hero(
          child: CustomLogoWidget(
            size: 300.0,
          ),
          tag: 'hero2',
        ),
      ),
    );
  }
}
