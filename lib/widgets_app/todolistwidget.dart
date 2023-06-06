import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/model/todo.dart';
import 'package:todoapp/providers_app/todos.dart';

import 'todowidget.dart';

class ToDoListWidget extends StatelessWidget {
  const ToDoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;

    return todos.isEmpty
        ? Center(child: Text("No todos.", style: TextStyle(fontSize: 20)))
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];

              return TodoWidget(todo: todo);
            },
            separatorBuilder: (context, index) => Container(height: 18));
  }
}
