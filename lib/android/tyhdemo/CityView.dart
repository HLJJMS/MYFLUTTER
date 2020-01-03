import 'package:flutter/material.dart';

class CityView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "层次布局",
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.network(
              "https://s2.ax1x.com/2019/05/28/Ve2smV.jpg",
              width: double.infinity,
            ),
            new Container(
              child: new Text("我在禁地下"),
              alignment: Alignment.bottomCenter,
            ),
            new Container(
              child: new Text("上面"),
              alignment: Alignment.topCenter,
            ),
            new Container(
              child: new Text("左"),
              alignment: Alignment.centerLeft,
            ),
            new Container(
              child: new Text("右"),
              alignment: Alignment.centerRight,
            ),
            new Container(
              child: new Text("上左"),
              alignment: Alignment.topLeft,
            ),
            new Container(
              child: new Text("上右"),
              alignment: Alignment.topRight,
            ),
          ],
        ),
      ),
    );
  }
}
