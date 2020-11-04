import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  static const String routeName = '/secondRoute';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Will you marry me?'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Pop here with "Yep"...
                  Navigator.pop(context,"Yep!");
                },
                child: Text('Yep!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Pop here with "Nope"
                  Navigator.pop(context,"Of course");
                },
                child: Text('Of course.'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
