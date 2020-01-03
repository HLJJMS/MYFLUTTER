import 'package:flutter/material.dart';

import 'Entity.dart';

class DetailsDemo extends StatelessWidget {
  final Entity entity;

  DetailsDemo(this.entity);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('${entity.title}'),
      ),
      body: new Padding(
        padding: new EdgeInsets.all(15.0),
        child: new Column(
          children: <Widget>[
            new Text('${entity.content}'),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new RaisedButton(
                  onPressed: () {
                    Navigator.pop(context, "返回值 11111");
                  },
                  child: new Text("返回 11111"),
                ),
                new RaisedButton(
                  onPressed: () {
                    Navigator.pop(context, "返回值 22222");
                  },
                  child: new Text("返回 22222"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
