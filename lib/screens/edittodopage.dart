import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers_app/todos.dart';
import 'package:todoapp/widgets_app/todoformwidget.dart';

import '../model/todo.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;

  const EditTodoPage({Key? key, required this.todo}) : super(key: key);

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final _formkey = GlobalKey<FormState>();

  late String title;
  late String description;

  @override
  void initState() {
    super.initState();

    title = widget.todo.title;
    description = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Edit Todo'),
          actions: [IconButton(onPressed: () {
            final provider = Provider.of<TodosProvider>(context,listen: false);
            provider.removeTodo(widget.todo);

            Navigator.of(context).pop();

          }, icon: Icon(Icons.delete))],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formkey,
            child: ToDoFormWidget(
              title: title,
              description: description,
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) =>
                  setState(() => this.description = description),
              onSavedTodo: saveTodo,
            ),
          ),
        ),
      );

  void saveTodo() {
    final isValid = _formkey.currentState?.validate();

    if (!isValid!) {
      return;
    } else {
      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.updateTodo(widget.todo, title, description);

      Navigator.of(context).pop();
    }
  }
}
