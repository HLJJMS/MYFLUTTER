import 'package:flutter/material.dart';

class ContainerChildView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('child 属性'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('''
容器中包含的[子容器]。如果为空，且[约束]是无界的或也是空的，则容器将展开以填充其父容器中的所有可用空间，除非父类提供无界约束，在这种情况下容器将尝试尽可能小。'''),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Text('''
Container(
  width: 100,
  height: 100,
  color: Colors.blue,
  child: Container(
    width: 10,
    height: 10,
    color: Colors.red,
  ),
),           
            '''),
            Text(
              '蓝色为父容器',
              style: TextStyle(color: Colors.blue),
            ),
            Text(
              '红色为子容器',
              style: TextStyle(color: Colors.red),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: Container(
                width: 10,
                height: 10,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
