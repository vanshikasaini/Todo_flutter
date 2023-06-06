import 'package:flutter/cupertino.dart';

import '../model/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(createdTime: DateTime.now(), title: 'Eat veg diet'),
    Todo(createdTime: DateTime.now(), title: 'Plan Jacob birthday party'),
    Todo(
        createdTime: DateTime.now(),
        title: 'Plan family trip to Lucknow',
        description: '''-Rent some hotels
  -Rent a car
  -pack suitcase'''),
    Todo(createdTime: DateTime.now(), title: 'buy food', description: '''-egg
  -milk
  -Ladyfinger''')
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
  List<Todo> get todosCompleted => _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }
  bool toggleTodoStatus(Todo todo) {
    todo.isDone =!todo.isDone;
    notifyListeners();

    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description){
    todo.title = title;
    todo.description = description;

    notifyListeners();
  }
}
