import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pretty_json/pretty_json.dart';

void main() {
  runApp(const MyApp());
}

final dartMap = {
  "id": 24,
  "name": "Manthan Khandale",
  "score": 7.6,
  "socials": null,
  "hobbies": [
    "Music",
    "Filmmaking",
  ],
  "isFlutterCool": true,
};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Pretty Json Example',
          ),
        ),
        body: Column(
          children: [
            PrettyJson(
              data: jsonEncode(dartMap),
              indentLength: 5,
              keyColor: Colors.green,
              backgroundColor: Colors.black,
              boolColor: Colors.white,
              nullColor: Colors.redAccent,
              stringColor: Colors.cyan,
              curlyBracketColor: Colors.yellow,
              doubleColor: Colors.deepOrange,
              squareBracketColor: Colors.amber,
              commaColor: Colors.yellow,
              colonColor: Colors.purple,
              intColor: Colors.lime,
              textStyle: const TextStyle(
                fontSize: 20,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
