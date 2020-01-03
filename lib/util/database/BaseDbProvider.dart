import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

import 'SqlManager.dart';

abstract class BaseDbProvider {
  bool isTableExits = false;

  createTableString();

  tableName();

  ///创建表sql语句
  tableBaseString(String sql) {
    return sql;
  }

  Future<Database> getDataBase() async {
    return await open();
  }

  ///super 函数对父类进行初始化
  @mustCallSuper
  prepare(name, String createSql) async {
    isTableExits = await SqlManager.isTableExits(name);
    if (!isTableExits) {
      Database db = await SqlManager.getCurrentDatabase();
      return await db.execute(createSql);
    }
  }

  @mustCallSuper
  open() async {
    if (!isTableExits) {
      await prepare(tableName(), createTableString());
    }
    return await SqlManager.getCurrentDatabase();
  }

  /// 增
  insert(String table, Map<String, dynamic> values) async {
    Database db = await getDataBase();
    await db.insert(table, values);
  }

  /// 删
  delete(String table, String where, List<dynamic> whereArgs) async {
    Database db = await getDataBase();
    await db.delete(table, where: '$where = ?', whereArgs: whereArgs);
  }

  /// 改
  update(String table, Map<String, dynamic> columns, String where,
      List<dynamic> whereArgs) async {
    Database db = await getDataBase();
    await db.update(table, columns, where: '$where = ?', whereArgs: whereArgs);
  }

  /// 查
  Future<List<Map>> query(String table,
      {List<String> columns, String where, List<dynamic> whereArgs}) async {
    Database db = await getDataBase();
    List<Map> maps;
    if (where == null) {
      maps = await db.query(table,
          columns: columns, where: where, whereArgs: whereArgs);
    } else {
      maps = await db.query(table,
          columns: columns, where: '$where = ?', whereArgs: whereArgs);
    }
    return maps;
  }

  /// 查询数量
  Future<int> getCount(String table) async {
    Database db = await getDataBase();
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }
}
/// 数据库表 对应数据实体基类
abstract class BaseEntity {
  Map<String, dynamic> toMap();

  @override
  String toString() {
    return toMap().toString();
  }
}
