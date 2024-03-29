import 'package:flutter/material.dart';

class StateDemoPage extends StatefulWidget {

  final int initValue;

  const StateDemoPage({Key key, this.initValue}) : super(key: key);
  
  @override
  State<StatefulWidget> createState() {
    return _StateDemoState();
  }

}

class _StateDemoState extends State<StateDemoPage> {

  int _counter;

  /**
   * 当Widget第一次插入到Widget树时会被调用，对于每一个State对象，Flutter framework只会调用一次该回调，
   * 所以，通常在该回调中做一些一次性的操作，如状态初始化、订阅子树的事件通知等。
   */
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counter = widget.initValue;
    print("initState _counter:$_counter");
  }

  okBtnClick() {
    setState(() {
      _counter++;
    });
  }

  /**
   * 它主要是用于构建Widget子树的，会在如下场景被调用：
   * 在调用initState()之后。
   * 在调用didUpdateWidget()之后。
   * 在调用setState()之后。
   * 在调用didChangeDependencies()之后。
   * 在State对象从树中一个位置移除后（会调用deactivate）又重新插入到树的其它位置之后。
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateDemoPage页面'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Container(
          color: Colors.teal,
          width: 100,
          height: 100,
          child: Column(
            children: <Widget>[
              FlatButton(
                textColor: Colors.white,
                color: Colors.red,
                child: Text('$_counter'),
                onPressed: () => this.okBtnClick(),
              )
            ],
          ),
        )
      ),
    );
  }

  /**
   * 在widget重新构建时，Flutter framework会调用Widget.canUpdate来检测Widget树中同一位置的新旧节点，
   * 然后决定是否需要更新，如果Widget.canUpdate返回true则会调用此回调。
   * 正如之前所述，Widget.canUpdate会在新旧widget的key和runtimeType同时相等时会返回true，
   * 也就是说在在新旧widget的key和runtimeType同时相等时didUpdateWidget()就会被调用。
   */
  @override
  void didUpdateWidget(StateDemoPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  /**
   * 当State对象从树中被永久移除时调用；通常在此回调中释放资源。
   */
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose");
  }

  /**
   * 此回调是专门为了开发调试而提供的，在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用。
   */
  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print("reassemble");
  }
  /**
   * 当State对象的依赖发生变化时会被调用；
   */
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
  
  /**
   * 当State对象从树中被移除时，会调用此回调。在一些场景下，Flutter framework会将State对象重新插到树中，
   * 如包含此State对象的子树在树的一个位置移动到另一个位置时（可以通过GlobalKey来实现）。
   * 如果移除后没有重新插入到树中则紧接着会调用dispose()方法。
   */
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("deactivate");
  }
}