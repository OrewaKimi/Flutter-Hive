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

  // add new todo

  // delete todo


  Widget build(BuildContext context) {  
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}