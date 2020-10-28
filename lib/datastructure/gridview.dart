import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class gridview extends StatefulWidget {
  @override
  _gridviewState createState() => _gridviewState();
}

class _gridviewState extends State<gridview> {
  // Data (state)
  final List<String> nameList = <String>["Leisure","What is this life if, full of care","We have no time to stand and stare","No time to see beneath the borth","And stare as long as sheep or cow","sakdjf; askjdf ;asjdf ;kjas;dfjk;askjdf ;aksjd fjas;dfja;sdjf ;asjdf; kasj;df kj;askdjfpiaeuwfjasdk;fjpsaidfj;aksldjf;asjdcfas;,dfjc;kaejpasjf;s"];
  final List<Color> colorList = <Color> [Colors.purple,Colors.green,Colors.blueAccent,Colors.red,Colors.grey,Colors.transparent];
  final int picCount = 5;

  // build a widget
  // ပြော
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(100,(index){
          int colorIndex = index % colorList.length;
          int poemIndex = index % nameList.length;
          int picIndex = index % picCount;
          picIndex++;
          print("colorIndex : "+colorIndex.toString());
          return Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: colorList[colorIndex],
              border: Border.all(
                color: Colors.green,
                width: 8,
              ),
              borderRadius: BorderRadius.circular(25)
            ),
            child: Stack(
              children: [
                Image(
                  image: AssetImage('assets/pic ($picIndex).png'),
                ),
                Text("$index : "+nameList[poemIndex]),
              ]
            ),
          );
        }),
      ),
    );
  }
}
