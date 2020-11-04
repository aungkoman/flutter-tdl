import 'package:flutter/material.dart';
import 'package:todolist/routing/SecondRoute.dart';

class SelectForResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _getResultFromAnotherRoute(context);
      },
      child: Text('Will you marry me?'),
    );
  }

  // A method that launches the SelectionScreen and awaits the
  // result from Navigator.pop.
  _getResultFromAnotherRoute(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    /*
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => SecondRoute()),
    );

     */
    var result = await Navigator.pushNamed(context,SecondRoute.routeName);
    // if(result == null ) result = "There is no answer";
    // result = result ?? "There is no answer";
    result = (result == null) ? "There is no answer" : result;


    SnackBar snackBar = new SnackBar(content: new Text(result),
        backgroundColor: Colors.blueAccent);
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);


    print("result is "+ result);
    //Scaffold.of(context)..removeCurrentSnackBar()..showSnackBar(SnackBar(content: Text("$result"),));
    /*
    Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text("$result"),));
    */

    //final result = await Navigator.pushNamed(context,SecondRoute.routeName);
    //print("SecondRoute result is "+result);
  }
}