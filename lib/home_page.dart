import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/database.dart';
import 'package:to_do_list/dialog_box.dart';
import 'package:to_do_list/todo_tile.dart';
class HomePage extends StatefulWidget {


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  final _mybox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override

  void initState(){
    //if this is the 1st time ever opening the app, then create default data
    if(_mybox.get('TODOLIST')==null){
      db.createInitailData();
    }
    else{
      db.loadData();
    }
    super.initState();
  }

  //text controller
  final _controller = TextEditingController();


  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  //save new task
  void saveNewtask(){
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  //create a new task
  void createNewTask(){
    showDialog(
        context: context,
        builder: (context){
          return DialogBox(
            controller: _controller,
            onSave: saveNewtask,
            onCancel: () => Navigator.of(context).pop(),
          );
        },
    );
  }

  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF47525F),
      appBar: AppBar(
        title: Text('TO DO'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black54,
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),


      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskcompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deletFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}



