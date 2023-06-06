import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/model/todo.dart';
import 'package:todoapp/providers_app/todos.dart';

import '../screens/edittodopage.dart';
import '../utilsapp.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius : BorderRadius.circular(16),
    child: Slidable(
        key: Key(todo.id),
        startActionPane: ActionPane(
            // A motion is a widget used to control how the pane animates.
            motion: const ScrollMotion(),

            // A pane can dismiss the Slidable.
            //dismissible: DismissiblePane(onDismissed: () {}),

            // All actions are defined in the children parameter.
            children: [
              SlidableAction(
                onPressed: (_) => editTodo(context, todo),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              )
            ]),
        endActionPane: ActionPane(
            // A motion is a widget used to control how the pane animates.
            motion: const ScrollMotion(),

            // A pane can dismiss the Slidable.
            //dismissible: DismissiblePane(onDismissed: () {}),

            // All actions are defined in the children parameter.
            children: [
              SlidableAction(

                onPressed: (_)=> deleteTodo(context, todo),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              )
            ]),
        child: buildTodo(context)),
  );

  Widget buildTodo(BuildContext context) => GestureDetector(
    onTap: () => editTodo(context,todo),
    child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                activeColor: Theme.of(context).primaryColor,
                checkColor: Colors.white,
                value: todo.isDone,
                onChanged: (_) {
                  final provider = Provider.of<TodosProvider>(context,listen: false);
               final isDone = provider.toggleTodoStatus(todo);

               Utils.showSnackBar(context,
               isDone ? 'Task Completed' : 'task marked incomplete');
                },
              ),
              const SizedBox(width: 20),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 22),
                  ),
                  if (todo.description.isNotEmpty)
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Text(
                        todo.description,
                        style: TextStyle(fontSize: 20, height: 1.5),
                      ),
                    )
                ],
              ))
            ],
          ),
        ),
  );

  void deleteTodo(BuildContext context,Todo todo){
    final provider =Provider.of<TodosProvider>(context,listen :false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context,'Deleted the task');


  }
  
  void editTodo(BuildContext context,Todo todo) => Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => EditTodoPage(todo: todo)
  )
  );
}
