import 'package:flutter/material.dart';
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
    );
  }
}
