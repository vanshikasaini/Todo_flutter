import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/widgets_app/todolistwidget.dart';
import 'package:todoapp/widgets_app/todo_dialog.dart';

import 'completedlistwidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex =0;

  @override
  Widget build(BuildContext context) {
   final tabs =[
     ToDoListWidget(),
     CompletedListWidget()
   ];
return Scaffold(
  appBar: AppBar(
    title: Text(MyApp.title),
  ),
  bottomNavigationBar: BottomNavigationBar(
    backgroundColor:Theme.of(context).primaryColor ,
    unselectedItemColor: Colors.white.withOpacity(0.7),
    selectedItemColor: Colors.white,
    currentIndex: selectedIndex,
    onTap: (index) => setState(() {
      selectedIndex=index;
    }),
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.fact_check_outlined),
        label: 'Todos',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.done,size: 28),
        label: 'Completed',
      )
    ],
  ),
  body: tabs[selectedIndex],
  floatingActionButton: FloatingActionButton(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20)
    ),
    backgroundColor: Colors.black,
    onPressed: ()=>
        showDialog(context: context,
            builder: (BuildContext context) => AddToDoDialog(),
        barrierDismissible: false),
    child: Icon(Icons.add),
  ),

);

  }
}
