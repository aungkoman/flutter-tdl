import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:todolist/ui/mmcafe.dart';

import 'datastructure/customDrawer.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Hello World')),
      ),
      drawer: customDrawer(),
      // #docregion centered-text
      body: ListView(
        children: [
          Center(
            child: RaisedButton(
              child: Text('Chat App'),
              onPressed: (){
                Navigator.pushNamed(context, '/chat');
              },
            )
          ),
          Center(
              child: RaisedButton(
                child: Text('Grid App'),
                onPressed: (){
                  Navigator.pushNamed(context, '/chat');
                },
              )
          ),
        ] // children
      ),
      // #enddocregion centered-text
    );
  }
}
