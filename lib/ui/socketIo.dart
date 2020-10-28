import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class socketIo extends StatefulWidget {
  @override
  _socketIoState createState() => _socketIoState();
}

class _socketIoState extends State<socketIo> {


  @override
  void initState() {
    print("initState in socketIo");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child : Center(child : Text('hello world'))
    );
  }
}
