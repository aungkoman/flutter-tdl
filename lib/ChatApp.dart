import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:todolist/data/ChatAppData.dart';
import 'package:todolist/ui/mmcafe.dart';

import 'datastructure/customDrawer.dart';

class ChatApp extends StatelessWidget {
  static const String routeName = "/chatApp";
  @override
  Widget build(BuildContext context) {
    ChatAppData chatAppData = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Chatroom : '+chatAppData.username+' OK?')),
      ),
      drawer: customDrawer(),
      // #docregion centered-text
      body: mmcafe(),
      // #enddocregion centered-text
    );
  }
}
