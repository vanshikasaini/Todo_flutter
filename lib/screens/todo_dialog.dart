import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets_app/todoformwidget.dart';

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
    content :Column(
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
          onSavedTodo: (){}
        )
      ],
    )
  );
}
