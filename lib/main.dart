import 'package:flutter/material.dart';
import 'code_editor.dart';

// please start server first then run the app
// "npm start" in server folder
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Python Compiler',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CodeEditor(),
    );
  }
}
