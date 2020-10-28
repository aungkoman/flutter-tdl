import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class listTile extends StatefulWidget {
  @override
  _listTileState createState() => _listTileState();
}

class _listTileState extends State<listTile> {
  final snackBar = SnackBar(content: Text("This is snack bar",style: TextStyle(color: Colors.lightBlueAccent),));
  void showSnackBar(){
    Scaffold.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
          onTap: showSnackBar,
          child: Center(child: Text('hello...'),)),
    );
  }
}
