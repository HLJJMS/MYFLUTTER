import 'package:flutter/material.dart';
import 'package:flutter_app/util/database/PersonDbProvider.dart';
import 'package:fluttertoast/fluttertoast.dart';

final String tableBook = 'book';
final String columnId = '_id';
final String columnName = 'name';
final String columnAuthor = 'author';
final String columnPrice = 'price';
final String columnPublishingHouse = 'publishingHouse';

class DbDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DbDemoState();
  }
}

class _DbDemoState extends State<DbDemo> {
  // 新增 姓名 输入控制器
  TextEditingController _nameController = new TextEditingController();

  // 新增 手机号 输入控制器
  TextEditingController _mobileController = new TextEditingController();

  // 删除 姓名 输入控制器
  TextEditingController _deleteController = new TextEditingController();

  // 删除 id 输入控制器
  TextEditingController _deleteIdController = new TextEditingController();

  // 更新 姓名 输入控制器
  TextEditingController _updateIdController = new TextEditingController();

  // 更新 姓名 输入控制器
  TextEditingController _updateNameController = new TextEditingController();

  // 更新 姓名 输入控制器
  TextEditingController _updateMobileController = new TextEditingController();

  // 查询一条 id 输入控制器
  TextEditingController _oneController = new TextEditingController();

  String _data = "暂无数据";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "数据库",
          style: TextStyle(color: Colors.white),
        ),
      ),
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 10)),
              // 添加
              _getNameView(),
              _getMobileView(),
              _getSetBtnView(),
              Padding(padding: EdgeInsets.only(top: 10)),
              // 获取所有数据
              _getAllBtnView(),
              Padding(padding: EdgeInsets.only(top: 10)),
              // 获取一条数据
              _getOneView(),
              _getOneBtnView(),
              Padding(padding: EdgeInsets.only(top: 10)),
              // 根据名称删除
              _getDeleteView(),
              _getDeleteBtnView(columnPersonName),
              Padding(padding: EdgeInsets.only(top: 10)),
              // 根据id删除
              _getDeleteIdView(),
              _getDeleteIdBtnView(columnPersonId),
              Padding(padding: EdgeInsets.only(top: 10)),
              // 更新
              _getUpdateIdView(),
              _getUpdateNameView(),
              _getUpdateMobileView(),
              _getUpdateBtnView(),
              Padding(padding: EdgeInsets.only(top: 30)),
              Text(
                _data,
                style: TextStyle(color: Colors.red, fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// 添加 姓名
  _getNameView() {
    return TextField(
      keyboardType: TextInputType.text,
      style: TextStyle(color: Color(0xFF888888)),
      controller: _nameController,
      decoration: InputDecoration(
        hintText: "姓名",
        hintStyle: TextStyle(color: Color(0xFF888888)),
        contentPadding:
            EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  /// 获取一条数据 id输入框
  _getOneView() {
    return TextField(
      keyboardType: TextInputType.text,
      style: TextStyle(color: Color(0xFF888888)),
      controller: _oneController,
      decoration: InputDecoration(
        hintText: "根据id查询",
        hintStyle: TextStyle(color: Color(0xFF888888)),
        contentPadding:
            EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  /// 添加 手机号
  _getMobileView() {
    return TextField(
      keyboardType: TextInputType.phone,
      style: TextStyle(color: Color(0xFF888888)),
      controller: _mobileController,
      decoration: InputDecoration(
        hintText: "电话",
        hintStyle: TextStyle(color: Color(0xFF888888)),
        contentPadding:
            EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  /// 添加 按钮
  _getSetBtnView() {
    return RaisedButton(
        onPressed: () {
          PersonEntity entity = new PersonEntity(
              name: _nameController.text, mobile: _mobileController.text);
          PersonDbProvider().addPerson(entity);
        },
        child: Text(
          "添加人员",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        color: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ));
  }

  /// 获取所有数据按钮
  _getAllBtnView() {
    return RaisedButton(
        onPressed: () async {
          List<PersonEntity> list = await PersonDbProvider().queryPerson(
              columns: [columnPersonId, columnPersonMobile, columnPersonName]);
          setState(() {
            _data = "查询结果：$list";
          });
        },
        child: Text(
          "查询所有人员",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        color: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ));
  }

  /// 获取一条数据 按钮
  _getOneBtnView() {
    return RaisedButton(
        onPressed: () async {
          List<PersonEntity> list = await PersonDbProvider().queryPerson(
              columns: [columnPersonId, columnPersonMobile, columnPersonName],
              where: columnPersonId,
              whereArgs: [int.parse(_oneController.text)]);
          setState(() {
            _data = "查询结果：$list";
          });
        },
        child: Text(
          "根据id查询",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        color: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ));
  }

  /// 根据名称删除 姓名输入框
  _getDeleteView() {
    return TextField(
      keyboardType: TextInputType.text,
      style: TextStyle(color: Color(0xFF888888)),
      controller: _deleteController,
      decoration: InputDecoration(
        hintText: "删除人名",
        hintStyle: TextStyle(color: Color(0xFF888888)),
        contentPadding:
            EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  /// 根据id删除 id输入框
  _getDeleteIdView() {
    return TextField(
      keyboardType: TextInputType.text,
      style: TextStyle(color: Color(0xFF888888)),
      controller: _deleteIdController,
      decoration: InputDecoration(
        hintText: "删除人id",
        hintStyle: TextStyle(color: Color(0xFF888888)),
        contentPadding:
            EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  /// 根据名称删除 按钮
  _getDeleteBtnView(String column) {
    return RaisedButton(
        onPressed: () async {
          await PersonDbProvider()
              .deletePerson(column, [_deleteController.text]);
        },
        child: Text(
          "删除",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        color: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ));
  }

  /// 根据id删除 按钮
  _getDeleteIdBtnView(String column) {
    return RaisedButton(
        onPressed: () async {
          await PersonDbProvider()
              .deletePerson(column, [_deleteIdController.text]);
        },
        child: Text(
          "删除",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        color: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ));
  }

  /// 更新数据 数据id输入框
  _getUpdateIdView() {
    return TextField(
      keyboardType: TextInputType.number,
      style: TextStyle(color: Color(0xFF888888)),
      controller: _updateIdController,
      decoration: InputDecoration(
        hintText: "id",
        hintStyle: TextStyle(color: Color(0xFF888888)),
        contentPadding:
            EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  /// 更新数据 人名输入框
  _getUpdateNameView() {
    return TextField(
      keyboardType: TextInputType.text,
      style: TextStyle(color: Color(0xFF888888)),
      controller: _updateNameController,
      decoration: InputDecoration(
        hintText: "根据id修改姓名",
        hintStyle: TextStyle(color: Color(0xFF888888)),
        contentPadding:
            EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  /// 更新数据 手机号输入框
  _getUpdateMobileView() {
    return TextField(
      keyboardType: TextInputType.phone,
      style: TextStyle(color: Color(0xFF888888)),
      controller: _updateMobileController,
      decoration: InputDecoration(
        hintText: "根据id修改电话",
        hintStyle: TextStyle(color: Color(0xFF888888)),
        contentPadding:
            EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  /// 更新数据 按钮
  _getUpdateBtnView() {
    return RaisedButton(
        onPressed: () async {
          var entity = PersonEntity(
              id: int.parse(_updateIdController.text),
              name: _updateNameController.text,
              mobile: _updateMobileController.text);
          await PersonDbProvider()
              .updatePerson(entity.toMap(), columnPersonId, [entity.id]);
        },
        child: Text(
          "更新",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        color: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ));
  }
}
