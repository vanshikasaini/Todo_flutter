import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../providers_app/todos.dart';
import '../widgets_app/todowidget.dart';

class CompletedListWidget extends StatelessWidget {
  const CompletedListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todosCompleted;

    return todos.isEmpty
        ? Center(child: Text("No completed tasks.", style: TextStyle(fontSize: 20)))
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
