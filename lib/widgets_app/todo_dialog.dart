import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/model/todo.dart';
import 'package:todoapp/providers_app/todos.dart';

import 'todoformwidget.dart';

class AddToDoDialog extends StatefulWidget {
  const AddToDoDialog({Key? key}) : super(key: key);

  @override
  State<AddToDoDialog> createState() => _AddToDoDialogState();
}

class _AddToDoDialogState extends State<AddToDoDialog> {

  final _formKey = GlobalKey<FormState>();
  String title='';
  String description='';



  @override
  Widget build(BuildContext context) => AlertDialog(
    content :Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Add Todo',style: TextStyle(
            fontWeight: FontWeight.bold,fontSize: 22
          ),
          ),
          const SizedBox(height: 8),
          ToDoFormWidget(
            onChangedTitle : (title) => setState(()=> this.title =title),
            onChangedDescription : (description) => setState(()=> this.description =description),
            onSavedTodo: addTodo
          )
        ],
      ),
    )
  );
/// Form to validate the textfields,
  ///  validate() calls validator
  void addTodo(){
final isValid = _formKey.currentState?.validate();

if(!isValid!){
  return;
}
else{
  final todo =Todo(createdTime: DateTime.now(),
      title: title,
  description: description,
  id: DateTime.now().toString());


  final provider =Provider.of<TodosProvider>(context,listen:false);
  provider.addTodo(todo);
  ///Hide AlertDialog
  Navigator.of(context).pop();

}

  }
}
