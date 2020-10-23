import 'package:flutter/cupertino.dart';

class helloworld extends StatelessWidget {
  var textStyle = TextStyle(fontSize: 24);
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Text('hello world',style: textStyle),
         Text("what's this life if full of care",style: textStyle),
         Text("We have no time to stand and stare. No time to see beneath the board.",style: textStyle),
         Text("And stare as long as sheep or cow"),
         listItem()
       ] // Column-children
    );
  }

  Widget listItem(){
    return Center(
      child: Text("Leasure")
    );
  }
}
