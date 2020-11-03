import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:todolist/ChatApp.dart';
import 'package:todolist/ui/mmcafe.dart';
import 'datastructure/customDrawer.dart';

class MainApp extends StatelessWidget {
  static const routeName = '/';
  /* staic ရတယ် ဆိုတာက MainApp ကို instance တိုင်းက share လုပ်ပြီး သုံးကြမယ်လို့ ဆိုလိုတာ
    ပိုရှင်းအောင် ဆိုရင် route table ထဲကို ကြည့်ကြည့်လိုက် wow သွားလိမယ်
   */
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
                Navigator.pushNamed(context, ChatApp.routeName);
              },
            )
          ),
          Center(
              child: RaisedButton(
                child: Text('Grid App'),
                onPressed: (){
                  Navigator.pushNamed(context, MainApp.routeName);
                },
              )
          ),
        ] // children
      ),
      // #enddocregion centered-text
    );
  }
}
