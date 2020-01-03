import 'package:flutter/material.dart';


class SecondPage extends StatefulWidget {
  
  final String str;

  SecondPage({this.str});
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    print("str$str");
    return SecondPageState(showContext: str);
  }
    
}

class SecondPageState extends State<SecondPage> {

  final String showContext;

  SecondPageState({ this.showContext });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var args = ModalRoute.of(context).settings.arguments;
    print('showContext:$showContext');
    print("args:$args");
    return Scaffold(
      appBar: AppBar(
        title: Text('第二个页面'),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text('返回'),
              ),
              Text(this.showContext)
            ]
          )
        ),
      ),
    );
  }
  
}