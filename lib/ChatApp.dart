import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:todolist/ui/mmcafe.dart';

import 'datastructure/customDrawer.dart';

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Chatroom')),
      ),
      drawer: customDrawer(),
      // #docregion centered-text
      body: mmcafe(),
      // #enddocregion centered-text
    );
  }
}
