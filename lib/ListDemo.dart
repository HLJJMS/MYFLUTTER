
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListDemoPage extends StatelessWidget {

  List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    this.todos = List.generate(20, (i) => new Todo('我是表头$i项', '我是内容$i'));

    return Scaffold(
      appBar: new AppBar(
        title: Text('列表Demo')
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index){
          return new ListTile(
            title: Text(todos[index].title),
            subtitle: Text(todos[index].description),
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => DetailPage(todo: todos[index])),
              );
              print(todos[index]);
            },
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {

  final Todo todo;

  const DetailPage({Key key, this.todo}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title)
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text(todo.description)
      )
    );
  }
  
}


class Todo {
  final String title;
  final String description;
  Todo(this.title, this.description);
}