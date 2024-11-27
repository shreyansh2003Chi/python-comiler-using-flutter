import 'package:flutter/material.dart';
import 'code_editor.dart'; // Import the code editor

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Python Compiler',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CodeEditor(), // Set CodeEditor as the home screen
    );
  }
}
