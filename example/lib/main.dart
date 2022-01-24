import 'package:flutter/material.dart';
import 'package:preety_json/preety_json.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Preety Json Example'),
        ),
        body: PreetyJson(data: '{"a":"A"}'),
      ),
    );
  }
}
