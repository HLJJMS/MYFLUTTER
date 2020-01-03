import 'package:flutter/material.dart';

import 'Entity.dart';

class ListDemo extends StatelessWidget {
  final List<Entity> articles = new List.generate(
    10,
    (i) => new Entity(
      title: "标题 $i",
      content: "列表项 $i: 我是列表",
    ),
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("列表"),
      ),
      // 创建列表
      body: new ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return new ListTile(
            title: new Text(articles[index].title),
            onTap: () async {
              var result = await Navigator.pushNamed(context, "yk/DetailsDemo",
                  arguments: articles[index]);
              if (result != null) {
                Scaffold.of(context).showSnackBar(
                  new SnackBar(
                    content: new Text("$result"),
                    duration: const Duration(seconds: 1),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
