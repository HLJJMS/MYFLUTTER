import 'package:flutter/material.dart';
import 'package:flutter_app/liuc/component/customLogoWidget.dart';
import 'package:flutter_app/util/routerUtil.dart';

class HeroFirstScreen extends StatefulWidget {
  HeroFirstScreen({Key key}) : super(key: key);

  @override
  _HeroFirstScreenState createState() => _HeroFirstScreenState();
}

class _HeroFirstScreenState extends State<HeroFirstScreen> {
  @override
  Widget build(BuildContext context) {
    print("hero1");
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          debugPrint('hero1点击事件');
          RouterUtil.navigateTo(context, "/lc/animatable/hero2");
        },
        child: Center(
          child: Hero(
            child: CustomLogoWidget(
              size: 50.0,
            ),
            tag: 'hero1',
          ),
        ),
      ),
    );
  }
}
