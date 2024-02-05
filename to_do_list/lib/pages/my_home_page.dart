import 'package:flutter/material.dart';
import 'package:to_do_list/utils/todo_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //list of tasks
  List TodoList = [
    {'taskName': 'Task 1', 'taskCompleted': false},
    {'taskName': 'Task 2', 'taskCompleted': false},
    {'taskName': 'Task 3', 'taskCompleted': false},
    {'taskName': 'Task 4', 'taskCompleted': false},
    {'taskName': 'Task 5', 'taskCompleted': false},
  ];
//function to change the state of the checkbox
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      TodoList[index]['taskCompleted'] = !TodoList[index]['taskCompleted'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text('TO DO'),
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: TodoList.length,
          itemBuilder: (context, index) {
            return TodoTitle(
              taskName: TodoList[index]['taskName'],
              taskCompleted: TodoList[index]['taskCompleted'],
              onChanged: (value) => checkBoxChanged(value, index),
            );
          }),
    );
  }
}
