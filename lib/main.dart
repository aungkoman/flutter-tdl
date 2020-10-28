import 'package:flutter/material.dart';
import 'package:todolist/datastructure/customDrawer.dart';
import 'package:todolist/datastructure/listTile.dart';
import 'package:todolist/package/helloworld.dart';
import 'package:todolist/ui/mainpage.dart';
import 'package:todolist/ui/mmcafe.dart';
import 'package:todolist/ui/tasklist.dart';
import 'ChatApp.dart';
import 'MainApp.dart';
import 'datastructure/gridview.dart';
import 'package/helloworld.dart';
import 'ui/socketIo.dart';
void main() => runApp(MyApp());

// #docregion MyApp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      initialRoute: '/',
      routes: {
        '/' : (context) => MainApp(),
        '/chat' : (context) => ChatApp(),
      },
    );
  }

  /*
  Drawer(
          child: ListView(
            padding: EdgeInsets.all(8),
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                    color: Colors.blueAccent
                ),
              ),
              ListTile(
                leading: Icon(Icons.people,color: Colors.green,),
                title: Text('List Tile Title'),
                onTap: (){
                  print("list tile title onTap");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.headset, color: Colors.redAccent),
                title: Text('List Title 2'),
                trailing: Icon(Icons.send, color: Colors.lightBlueAccent),
                onTap: (){
                  print("list tile 2 onTap");
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
   */
}