import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SqlAndSP extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplAndSP();
  }
}

class _SplAndSP extends State<SqlAndSP> {
  TextEditingController sharedController = TextEditingController();
  TextEditingController sqlController = TextEditingController();
  String shareTxt = "shared_preferences";
  String sqlTxt = "SQLLITE";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: new Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            new Text(
              shareTxt,
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
            new TextField(
              controller: sharedController,
            ),
            new Text(
              sqlTxt,
              style: TextStyle(color: Colors.brown, fontSize: 20),
            ),
            new TextField(
              controller: sqlController,
            ),
            new FlatButton(
                onPressed: () {_saveSharePreference();},
                child: new Text(
                  "写入数据库和shared_preferences",
                  style: TextStyle(color: Colors.greenAccent, fontSize: 20),
                ))
          ],
        ),
      )),
    );
  }

//  存储SharePreference
  Future<Null> _saveSharePreference() async {
    String key = "KEY";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(sharedController.text.length>0){
      sharedPreferences.setString(key, sharedController.text);
      _getSharePreference();
    }

  }

//  取数据
  Future<Null> _getSharePreference() async {
    String key = "KEY";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      shareTxt = sharedPreferences.get(key);
    });
  }
}
