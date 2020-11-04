

import 'package:flutter/material.dart';
import 'package:todolist/routing/SelectForResult.dart';

class FirstRoute extends StatelessWidget {
  static const  String routeName = "/firstRoute";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      // Create the SelectionButton widget in the next step.
      body: Center(child: SelectForResult()),
    );
  }
}
