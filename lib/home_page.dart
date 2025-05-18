import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('MY_BOX');
  final _textController = TextEditingController();
  List todos = [];

  @override
  void initState() {
    todos = _myBox.get('TODO_LIST') ?? [];
    super.initState();
  }

  void openNewTodo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text('Add Task', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        content: TextField(
          controller: _textController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Enter your task...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _textController.clear();
            },
            child: Text('Cancel', style: GoogleFonts.poppins(color: Colors.grey[600])),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              addTodo();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurpleAccent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: Text('Add', style: GoogleFonts.poppins(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void addTodo() {
    String todo = _textController.text;
    setState(() {
      todos.add(todo);
      _textController.clear();
    });
    saveToDatabase();
  }

  void deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
    saveToDatabase();
  }

  void saveToDatabase() {
    _myBox.put('TODO_LIST', todos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('My To-Do List', style: GoogleFonts.poppins(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openNewTodo,
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: todos.isEmpty
          ? Center(
              child: Text(
                'No tasks yet!',
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle_outline, color: Colors.deepPurpleAccent),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          todo,
                          style: GoogleFonts.poppins(fontSize: 16),
                        ),
                      ),
                      IconButton(
                        onPressed: () => deleteTodo(index),
                        icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
