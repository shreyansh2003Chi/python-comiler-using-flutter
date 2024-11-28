import 'package:http/http.dart' as http;
import 'dart:convert';

class PythonService {
  static const String _serverUrl = 'http://192.168.239.253:3000/run_code';
  // if you have to run please ensure conected your device with same network
// here is my ip address if you wan to perform test on your local machine you have to follow below steps
// 1 . CMD -> ipconfig
// 2. copy ipv4 address
// 3. replace 192.168.38.253 with your ipv4 address Thanks....
  static Future<String> runPythonCode(String code) async {
    try {
      final response = await http.post(
        Uri.parse(_serverUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'code': code}),
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        return 'Error: ${response.statusCode}';
      }
    } catch (e) {
      return 'Error: Unable to connect to server';
    }
  }
}
