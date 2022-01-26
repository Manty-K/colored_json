import 'package:flutter/material.dart';
import 'package:pretty_json/pretty_json.dart';

void main() {
  runApp(const MyApp());
}

const String jsonData = '''
{
  'id':1,
  'name':'Pretty Json',
  'isFlutterAwesome':true,
}
''';

const responseBody = '''
[
  {
    "id": 1,
    "name": "Manthan Khandale",
    "username": "mantyk",
    "email": "manthan@flutter.com",
    "hobbies": [
    "Music",
    Filmmaking     
    ],
    "isFlutterCool": true,
    "company": {
      "name": "Romaguera-Crona",
      "catchPhrase": "Multi-layered client-server neural-net",
      "bs": "harness real-time e-markets"
    }
  }
  
]
 

''';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pretty Json Example'),
        ),
        body: SingleChildScrollView(
          child: PrettyJson(
            data: responseBody,
          ),
        ),
      ),
    );
  }
}
