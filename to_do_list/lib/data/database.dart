import 'package:hive/hive.dart';

class ToDoDataBase {
  List toDoList = [];

  //reference our box
  final _myBox = Hive.box('myBox');

//run this method if this is the first time the app is running
  void createInitialData() {
    toDoList = [
      {'taskName': 'Hacer el Todo', 'taskCompleted': false},
      {'taskName': 'Modificar los errores', 'taskCompleted': false},
    ];
  }

  //load the data from the database
  void loadData() {
    toDoList = _myBox.get('todo');
  }

  //update the database
  void updateData() {
    _myBox.put('todo', toDoList);
  }
}
