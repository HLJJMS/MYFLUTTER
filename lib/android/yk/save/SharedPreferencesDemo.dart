import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SharedPreferencesState();
  }
}

class _SharedPreferencesState extends State<SharedPreferencesDemo> {
  TextEditingController _keyController = new TextEditingController();
  TextEditingController _valueController = new TextEditingController();
  String _data = "暂无数据";
  SharedPreferences sp;

  @override
  Future initState() {
    super.initState();
    _initSP();
  }

  Future _initSP() async {
    sp = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "SharedPreferences存储",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                "使用键值对进行存储数据",
                style: TextStyle(fontSize: 14, color: Color(0xff666666)),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            _getKeyView(),
            Padding(padding: EdgeInsets.only(top: 10)),
            _getValueView(),
            Padding(padding: EdgeInsets.only(top: 10)),
            _getSetBtnView(),
            Padding(padding: EdgeInsets.only(top: 10)),
            _getSetListBtnView(),
            Padding(padding: EdgeInsets.only(top: 10)),
            _getRemoveBtnView(),
            Padding(padding: EdgeInsets.only(top: 10)),
            _getClearBtnView(),
            Padding(padding: EdgeInsets.only(top: 10)),
            _getGetBtnView(),
            Padding(padding: EdgeInsets.only(top: 10)),
            _getContainsKeyBtnView(),
            Padding(padding: EdgeInsets.only(top: 30)),
            Text(
              _data,
              style: TextStyle(color: Colors.red, fontSize: 18),
            )
          ],
        ),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  _getKeyView() {
    return TextField(
      keyboardType: TextInputType.text,
      style: TextStyle(color: Color(0xFF888888)),
      controller: _keyController,
      decoration: InputDecoration(
        hintText: "key值",
        hintStyle: TextStyle(color: Color(0xFF888888)),
        contentPadding:
            EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  _getValueView() {
    return TextField(
      keyboardType: TextInputType.text,
      style: TextStyle(color: Color(0xFF888888)),
      controller: _valueController,
      decoration: InputDecoration(
        hintText: "value值",
        hintStyle: TextStyle(color: Color(0xFF888888)),
        contentPadding:
            EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  _getSetBtnView() {
    return RaisedButton(
        onPressed: () {
          if (_keyController.text == null || _keyController.text == "") {
            Fluttertoast.showToast(
                msg: "key值不能为空", backgroundColor: Colors.orange);
            return;
          }
//          if (_valueController.text == null || _valueController.text == "") {
//            Fluttertoast.showToast(
//                msg: "插入value不能为空！", backgroundColor: Colors.orange);
//            return;
//          }
          sp.setString(_keyController.text, _valueController.text);
        },
        child: Text(
          "根据key值 保存/修改",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        color: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ));
  }

  _getSetListBtnView() {
    return RaisedButton(
        onPressed: () {
          if (_keyController.text == null || _keyController.text == "") {
            Fluttertoast.showToast(
                msg: "key值不能为空", backgroundColor: Colors.orange);
            return;
          }
          var list = ["a", "b", "c", "d", "e", "f"];
          sp.setStringList(_keyController.text, list);
        },
        child: Text(
          "保存字符串数组",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        color: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ));
  }

  _getRemoveBtnView() {
    return RaisedButton(
        onPressed: () {
          if (_keyController.text == null || _keyController.text == "") {
            Fluttertoast.showToast(
                msg: "key值不能为空", backgroundColor: Colors.orange);
            return;
          }
          sp.remove(_keyController.text);
        },
        child: Text(
          "删除数据",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        color: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ));
  }

  _getClearBtnView() {
    return RaisedButton(
        onPressed: () {
          sp.clear();
        },
        child: Text(
          "删除所有数据",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        color: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ));
  }

  _getGetBtnView() {
    return RaisedButton(
        onPressed: () {
          if (_keyController.text == null || _keyController.text == "") {
            Fluttertoast.showToast(
                msg: "key值不能为空", backgroundColor: Colors.orange);
            return;
          }
          setState(() {
            _data =
                "数据详情：key:${_keyController.text} value:${sp.get(_keyController.text)}";
          });
        },
        child: Text(
          "查询一条数据",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        color: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ));
  }

  _getContainsKeyBtnView() {
    return RaisedButton(
        onPressed: () {
          if (_keyController.text == null || _keyController.text == "") {
            Fluttertoast.showToast(
                msg: "key值不能为空", backgroundColor: Colors.orange);
            return;
          }
          setState(() {
            _data = "是否存在:${sp.containsKey(_keyController.text)}";
          });
        },
        child: Text(
          "判断是否存在key",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        color: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ));
  }
}
