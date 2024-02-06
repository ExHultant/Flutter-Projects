import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list/data/database.dart';
import 'package:to_do_list/utils/dialog_box.dart';
import 'package:to_do_list/utils/todo_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  final _myBox = Hive.box('myBox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_myBox.get('todo') == null) {
      db.createInitialData();
    } else {
      //there already exists data in the database
      db.loadData();
    }
    //IS THIS THE FIRST TIME EVER OPENING THE APP, THEN CREATE INITIAL DATA
    super.initState();
  }

  //text controller
  final _controller = TextEditingController();

//function to change the state of the checkbox
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index]['taskCompleted'] =
          !db.toDoList[index]['taskCompleted'];
    });
    db.updateData();
  }

//save the new task
  void saveNewTask() {
    if (_controller.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Por favor ingrese una tarea'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  db.updateData();
                },
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        db.toDoList.add({'taskName': _controller.text, 'taskCompleted': false});
        _controller.clear();
        Navigator.of(context).pop();
      });
    }
  }

//Create new task
  void addNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () {
              _controller.clear();
              Navigator.of(context).pop();
            },
          );
        });
  }

  //delete a task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        title: const Center(
          child: Text(
            'TO DO LIST APP',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.green[600],
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.green[300],
      ),
      body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return TodoTitle(
              taskName: db.toDoList[index]['taskName'],
              taskCompleted: db.toDoList[index]['taskCompleted'],
              onChanged: (value) => checkBoxChanged(value, index),
              onDelete: ((p0) => deleteTask(index)),
              index: index,
            );
          }),
    );
  }
}
