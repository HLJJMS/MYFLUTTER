import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'bean/Bean.dart';

class SQLView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SQLView();
  }
}

class _SQLView extends State<SQLView> {
  TextEditingController oneCon = new TextEditingController();
  TextEditingController twoCon = new TextEditingController();
  static String dbName = "tyh.db";
  static String tabName = "tyh";
  String sql_createTable =
      "CREATE TABLE $tabName (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age TEXT)";
  String txt = "";
  String dbPath = '';
  Database db;

  @override
  void initState() {
    super.initState();
    _create();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: oneCon,
          ),
          TextField(
            controller: twoCon,
          ),
          FlatButton(
            child: new Text("存入"),
            onPressed: () {
              _add(oneCon.text.toString(), twoCon.text.toString());
            },
          ),
          FlatButton(
            child: new Text("读出"),
            onPressed: () {
              _query();
            },
          ),
          FlatButton(
            child: new Text("删除"),
            onPressed: () {
              _delete();
            },
          ),
          Text(txt)
        ],
      ),
    );
  }

//创建数据库
  Future<String> _createNewDb(String dbName) async {
    //获取数据库文件路径
    var dbPath = await getDatabasesPath();
    print('dbPath:' + dbPath);
    String path = join(dbPath, dbName);
    if (await new Directory(dirname(path)).exists()) {
      await deleteDatabase(path);
    } else {
      try {
        await new Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        print(e);
      }
    }
    return path;
  }

  _create() async {
    dbPath = await _createNewDb(dbName).toString();
    Database db = await openDatabase(dbPath);
    await db.execute(sql_createTable);
    await db.close();
    print('创建user.db成功，创建user_table成功');
  }

  //打开数据库，获取数据库对象
  _open() async {  
    if (null == dbPath) {
      var path = await getDatabasesPath();
      dbPath = join(path, dbName);
      print('dbPath:' + dbPath);
    }
    return await openDatabase(dbPath);
  }

  _add(String name, String age) async {
    Database db = await _open();
    String sql = "INSERT INTO $tabName(name,age) VALUES('$name','$age')";
    //开启事务
    await db.transaction((txn) async {
      int id = await txn.rawInsert(sql);
    });
    await db.close();
  }

  _query() async {
    Database db = await _open();
    List<Map> list = await db.rawQuery('SELECT * FROM $tabName');
    Bean a = Bean.fromMap(list.first);
    int b= a.id;
    print("我是B$b");
    await db.close();
    setState(() {
      txt = "$list";
    });
  }

  _delete() async {
    Database db = await _open();
    //删除最近一条
    String sql =
        "DELETE FROM $tabName where id in (select id from $tabName order by id desc limit 1)";
    int count = await db.rawDelete(sql);

    await db.close();

    setState(() {
      if (count == 1) {
        txt = "删除成功，请查看";
      } else {
        txt = "删除0条数据或删除失败，请看log";
      }
    });
  }
}
