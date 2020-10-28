import 'package:flutter/cupertino.dart';

class helloworld extends StatelessWidget {
  var textStyle = TextStyle(fontSize: 24, );
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Expanded(
             flex: 2,
             child: Center(child: Text('Leisure',style: textStyle))),
         Expanded(child: Text("what's this life if, full of care",style: textStyle)),
         Expanded(child : Text("We have no time to stand and stare. No time to see beneath the board.",style: textStyle)),
         Expanded(child: Text("And stare as long as sheep or cow")),
         listItem()
       ] // Column-children
    );
  }

  Widget listItem(){
    return Center(
      child: Text("Leisure")
    );
  }
}
