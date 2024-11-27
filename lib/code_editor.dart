// ... imports ...
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'services/python_service.dart';

class CodeEditor extends StatefulWidget {
  const CodeEditor({super.key});

  @override
  State<CodeEditor> createState() => _CodeEditorState();
}

class _CodeEditorState extends State<CodeEditor> {
  final TextEditingController _controller = TextEditingController();
  String _output = '';

  bool _isDarkMode = true;

  void _runCode() async {
    try {
      setState(() {                               
        _output = 'Running code...';
      });
      
      final result = await PythonService.runPythonCode(_controller.text);
      
      setState(() {
        _output = result;
      });
    } catch (e) {
      setState(() {
        _output = 'Error: ${e.toString()}';
      });
    }
  }

  void _clearCode() {
    setState(() {
      _controller.text = '';
      _output = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Python Compiler'),
        backgroundColor: _isDarkMode ? const Color(0xFF1E1E1E) : Colors.blue,
        actions: [
          IconButton(
            icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => setState(() => _isDarkMode = !_isDarkMode),
          ),
        ],
      ),
      backgroundColor: _isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _isDarkMode ? Colors.grey[800]! : Colors.grey[300]!,
                ),
              ),
              child: TextField(
                controller: _controller,
                maxLines: null,
                style: TextStyle(
                  color: _isDarkMode ? Colors.white : Colors.black,
                  fontSize: 14,
                  fontFamily: 'monospace',
                ),
                decoration: InputDecoration(
                  hintText: 'Write your Python code here...',
                  hintStyle: TextStyle(
                    color: _isDarkMode ? Colors.grey : Colors.grey[600],
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(12),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Output:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: _isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _isDarkMode ? const Color(0xFF2D2D2D) : Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _output,
                style: TextStyle(
                  color: _isDarkMode ? Colors.white : Colors.black,
                  fontFamily: 'monospace',
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.play_arrow),
                  color: _isDarkMode ? Colors.green : Colors.blue,
                  onPressed: _runCode,
                  tooltip: 'Run Code',
                ),
                IconButton(
                  icon: const Icon(Icons.clear),
                  color: _isDarkMode ? Colors.red : Colors.red,
                  onPressed: _clearCode,
                  tooltip: 'Clear Code',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
