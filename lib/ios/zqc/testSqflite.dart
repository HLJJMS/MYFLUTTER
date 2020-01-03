import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';

import 'testSqfliteData.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class TestSqfliteView extends StatefulWidget {
  // This class is the configuration for the state. It holds the
  // values (in this nothing) provided by the parent and used by the build
  // method of the State. Fields in a Widget subclass are always marked "final".

  @override
  TestSqfliteState createState() => new TestSqfliteState();
}

class TestSqfliteState extends State<TestSqfliteView> {
  var db = new SqfliteDatabaseHalper();
  var _result = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: '持久化',
      theme: ThemeData(primaryColor: Colors.white),
      home: new Scaffold(
          appBar: new AppBar(
            title: Text('持久化'),
            elevation: 0, //去掉appbar底部线和阴影
            leading: IconButton(
                icon: ImageIcon(new AssetImage('assets/image/nav_back.png')),
                onPressed: () {
                  Navigator.pop(context);
                }),
            actions: <Widget>[
              FlatButton(
                child: new Text(
                  '登录',
                  style: new TextStyle(
                    fontSize: 14.5,
                    color: Color.fromRGBO(54, 90, 247, 1),
                  ),
                ),
                onPressed: () {},
              )
            ],
          ),
          body: _mainView()),
    );
  }

  /* MARK: 主视图
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _mainView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _sqfliteSetView(),
        _sqfliteShowView(),
      ],
    );
  }

  /* MARK: sqflite操作视图
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _sqfliteSetView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 60,
          child: Row(
            children: <Widget>[
              FlatButton(
                child: new Text(
                  '创',
                  style: new TextStyle(
                    fontSize: 14.5,
                    color: Color.fromRGBO(54, 90, 247, 1),
                  ),
                ),
                onPressed: () {},
              ),
              FlatButton(
                child: new Text(
                  '增',
                  style: new TextStyle(
                    fontSize: 14.5,
                    color: Color.fromRGBO(54, 90, 247, 1),
                  ),
                ),
                onPressed: () async {
                  var note = Note(10, '_image', 10, 10, 128.200, 13.78);
                  await db.saveNote(note);
                  if (!mounted) return;
                  //Note not = await db.getNote(1);
                  await db.getNoteWithImage('_image').then((not) => {
                        setState(() {
                          this._result = not.image;
                          print(this._result);
                        })
                      });
                },
              ),
              FlatButton(
                child: new Text(
                  '删',
                  style: new TextStyle(
                    fontSize: 14.5,
                    color: Color.fromRGBO(54, 90, 247, 1),
                  ),
                ),
                onPressed: () async {
                  if (!mounted) return;
                  await db.deleteNoteWithImage('_image').then((isOk) => {
                        setState(() {
                          this._result = isOk.toString();
                          print(this._result);
                        })
                      });
                },
              ),
            ],
          ),
        ),
        Container(
            width: double.infinity,
            height: 30,
            child: Row(
              children: <Widget>[
                FlatButton(
                  child: new Text(
                    '改',
                    style: new TextStyle(
                      fontSize: 14.5,
                      color: Color.fromRGBO(54, 90, 247, 1),
                    ),
                  ),
                  onPressed: () async {
                    var note = await db.getNote(1);
                    if (note != null) {
                      // var map = note.toMap();
                      // map['image'] = 'kkkkkkllll';
                      // var newNote = Note.fromMap(map);
                      note.image = 'kkkkkkllll';
                      // await db.updateNote(newNote);
                      await db.updateNote(note);
                      await db.getNoteWithImage('kkkkkkllll').then((not) => {
                            setState(() {
                              this._result = not.image;
                              print(this._result);
                            })
                          });
                    }
                  },
                ),
                FlatButton(
                  child: new Text(
                    '查',
                    style: new TextStyle(
                      fontSize: 14.5,
                      color: Color.fromRGBO(54, 90, 247, 1),
                    ),
                  ),
                  onPressed: () async {
                    await db.getNote(1).then((not) => {
                          if (not != null)
                            {
                              setState(() {
                                this._result = not.image;
                                print(this._result);
                              })
                            }
                        });
                    await db.getAllNotes().then((list) => {print(list)});
                  },
                ),
                FlatButton(
                  child: new Text(
                    '查列数',
                    style: new TextStyle(
                      fontSize: 14.5,
                      color: Color.fromRGBO(54, 90, 247, 1),
                    ),
                  ),
                  onPressed: () async {
                    await db.getCount().then((count) => {
                          setState(() {
                            this._result = '$count';
                            print(this._result);
                          })
                        });
                  },
                ),
              ],
            )),
      ],
    );
  }

  /* MARK: sqflite显示视图
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _sqfliteShowView() {
    return Text(_result);
  }
}
