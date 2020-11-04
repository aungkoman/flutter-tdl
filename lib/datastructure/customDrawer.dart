import 'package:flutter/material.dart';
import 'package:todolist/ChatApp.dart';
import 'package:todolist/MainApp.dart';
import 'package:todolist/data/ChatAppData.dart';
import 'package:todolist/datastructure/listTile.dart';

class customDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            title: Text('Main App'),
            onTap: (){
              print("list tile title onTap");
              Navigator.pop(context);
              Navigator.pushNamed(context, MainApp.routeName);
              /*
              Navigator.push(context, PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (context, _, __) {
                    return ChatApp();
                  },
                  transitionsBuilder: (_, __, ___, Widget child) {
                    return child;
                  }
              ));

               */
            },
          ),
          ListTile(
            leading: Icon(Icons.headset, color: Colors.redAccent),
            title: Text('Chat App'),
            trailing: Icon(Icons.send, color: Colors.lightBlueAccent),
            onTap: (){
              print("list tile 2 onTap");
              Navigator.pop(context);
              Navigator.pushNamed(context, ChatApp.routeName, arguments: ChatAppData('user name', 'userId'));
            },
          )
        ],
      ),
    );
  }
}
