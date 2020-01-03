import 'package:flutter/material.dart';

class ContainerConstraintsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContainerConstraintsViewState();
  }
}

class _ContainerConstraintsViewState extends State<ContainerConstraintsView> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('constraints'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(20),
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('''
ConstrainedBox即创建一个Widget，该Widget对其子child施加附加约束。之前在constrain也有简单使用，即该组件一般集成在constrain中使用。
[RenderBox]布局的不可变布局约束。
如果且仅当以下所有关系成立时，[Size]才会遵从[BoxConstraints]：
[minWidth] <= [Size.width] <= [maxWidth]
[minHeight] <= [Size.height] <= [maxHeight]
约束本身必须满足这些关系：
0.0 <= [minWidth] <= [maxWidth] <= [double.infinity]
0.0 <= [minHeight] <= [maxHeight] <= [double.infinity]
[double.infinity]是每个约束的合法值(比如想要获取最大的扩展宽度，可以将宽度值设为double.infinity)
'''),
              Padding(padding: EdgeInsets.only(top: 10)),
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(border: Border.all()),
                  //利用UnconstrainedBox 消除之前限制
                  child: UnconstrainedBox(
                      // 对child进行约束，
                      child: ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: 30,
                              minWidth: 30,
                              maxHeight: 150,
                              maxWidth: 150),
                          child: Container(
                            width: 110,
                            height: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  colors: [Colors.blue, Colors.purple]),
                            ),
                          ))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
