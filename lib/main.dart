import 'package:flutter/material.dart';
import 'package:todolist/package/helloworld.dart';
import 'package/helloworld.dart';
void main() => runApp(MyApp());

// #docregion MyApp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('To Do List'),
        ),
        // #docregion centered-text
        body: helloworld(),
        // #enddocregion centered-text
      ),
    );
  }
}