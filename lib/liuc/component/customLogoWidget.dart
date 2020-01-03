import 'package:flutter/material.dart';

class CustomLogoWidget extends StatelessWidget {
  final double size;

  const CustomLogoWidget({Key key, this.size = 200}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      width: size,
      height: size,
      child: Center(
        child: FlutterLogo(size: 50),
      ),
    );
  }
}
