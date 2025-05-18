import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // get the box
  final _myBox = Hive.box('MY_BOX');

  // text controller
  final _textController = TextEditingController();

  // list of todos
  List todos = [];

  @override
  void initState() {
    // load data, if none exist then defalut
    todos = _myBox.get('TODO_LIST') ?? [];

    super.initState();
  }

  // open new todo dialog
  void openNewTodo() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Add Task'),
            content: TextField(controller: _textController),
            actions: [
              // cancel button
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _textController.clear();
                },
                child: const Text('Cancel'),
              ),

              // add button
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  addTodo();
                },
                child: const Text('Add'),
              ),
            ],
          ),
    );
  }

  // add new todo
  void addTodo() {
    // add todo to list
    setState(() {
      todos.add(_textController.text);
      _textController.clear();
    });
  }

  // delete todo
  void deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
    saveToDatabase();
  }


  // save to database
  void saveToDatabase() {
    _myBox.put('TODO_LIST', todos);
  }


  Widget build(BuildContext context) {
    return Scaffold(

      // add button
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),

      // display List of todos
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          // get each todo
          final todo = todos[index];

          return ListTile(
            title: Text(todo),
            trailing: IconButton(
               onPressed: () => deleteTodo(index),
              icon: const Icon(Icons.delete),
            ),
          ); 
        },
      ),
    );
  }
}
