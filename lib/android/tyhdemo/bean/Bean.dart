class Bean {
  int id;
  String name;
  String age;

  Bean(this.name, this.age, this.id);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "id": id,
      "name": name,
      "age": age,
    };
    return map;
  }

  Bean.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    age = map["age"];



  }
}
