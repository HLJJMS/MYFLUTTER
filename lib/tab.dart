import 'package:flutter/material.dart';

class TabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "TAB布局测试页",
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState(); //1
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  static int _selectedIndex = 1;
  List<Widget> _widget = <Widget>[
    Text(
      "Index :首页 ${_selectedIndex}",
      style: TextStyle(color: Colors.red),
    ),
    Text(
      'Index 1: 通讯录 ${_selectedIndex}',
      style: TextStyle(color: Colors.blue),
    ),
    Text(
      'Index 2: 设置 ${_selectedIndex}',
      style: TextStyle(color: Colors.yellow),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widget.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts), title: Text("第一个")),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("第三个")),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            title: Text('第三个'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
