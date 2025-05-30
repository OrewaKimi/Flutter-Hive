import 'package:flutter/material.dart';
import 'package:flutter_hive/home_page.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

void main()  async {
// Initialize Hive
await Hive.initFlutter();

// Open a box
await Hive.openBox('MY_BOX');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
