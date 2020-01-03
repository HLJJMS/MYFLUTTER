import 'BaseDbProvider.dart';

/// 表名
final String tablePersonName = 'PersonInfo';

/// 列
final String columnPersonId = "id";
final String columnPersonName = "name";
final String columnPersonMobile = "mobile";

/// person表 管理类
class PersonDbProvider extends BaseDbProvider {
  @override
  tableName() {
    return tablePersonName;
  }

  @override
  createTableString() {
    return '''
        create table $tablePersonName (
        $columnPersonId integer primary key,
        $columnPersonName text not null,
        $columnPersonMobile text not null
        )
      ''';
  }

  /// 添加人员
  addPerson(PersonEntity entity) {
    insert(tablePersonName, entity.toMap());
  }

  /// 删除人员
  deletePerson(String where, List<dynamic> whereArgs) {
    delete(tablePersonName, where, whereArgs);
  }

  /// 更新人员信息
  updatePerson(
      Map<String, dynamic> columns, String where, List<dynamic> whereArgs) {
    update(tablePersonName, columns, where, whereArgs);
  }

  /// 查询人员数量
  Future<int> getPersonCount() {
    return getCount(tablePersonName);
  }

  /// 查询人员
  /// where和whereArgs字段是用于筛选人员的，where为人员表列名，whereArgs
  Future<List<PersonEntity>> queryPerson(
      {List<String> columns, String where, List<dynamic> whereArgs}) async {
    var list = await query(tablePersonName,
        columns: columns, where: where, whereArgs: whereArgs);
    List<PersonEntity> persons = new List();
    for (var map in list) {
      persons.add(PersonEntity.fromMap(map));
    }
    return persons;
  }
}

class PersonEntity extends BaseEntity {
  int id;
  String name;
  String mobile;

  PersonEntity({int id, String name, String mobile}) {
    this.id = id;
    this.name = name;
    this.mobile = mobile;
  }

  PersonEntity.fromMap(Map<String, dynamic> map) {
    id = map[columnPersonId];
    mobile = map[columnPersonMobile];
    name = map[columnPersonName];
  }

  @override
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnPersonName: name,
      columnPersonMobile: mobile,
    };
    if (id != null) {
      map[columnPersonId] = id;
    }
    return map;
  }
}
