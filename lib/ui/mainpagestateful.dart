import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mainpagestate extends StatefulWidget {
  @override
  _mainpagestateState createState() => _mainpagestateState();
}

class _mainpagestateState extends State<mainpagestate> {

  final int taskId = 0;
  static List<String> taskList = <String>["Leisure","What is this life if, full of care","We have no time to stand and stare"];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: listView2,
        ),
        buttonNavigation()
      ],
    );
  }

  Widget buttonNavigation() {
    return Container(
      color: Colors.grey,
      height: 75,
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue,
              child: Center(child: Icon(Icons.menu)),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                print("onTap is fired");
              },
              child: Container(
                color: Colors.green,
                child: Center(child: Icon(Icons.add)),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.redAccent,
              child: Center(child: Icon(Icons.more)),
            ),
          )
        ],
      ),
    );
  }

  static Widget _createListItem1(String taskString) => Container(
    //color: Colors.blue,
    padding: const EdgeInsets.all(10),
    child: Row(
      children: [
        Container(
          child: Center(child: Icon(Icons.check_box,color: Colors.blueAccent)),
        ),
        Expanded(
          child: Container(
              padding: const EdgeInsets.fromLTRB(10,0,0,0),
              child : Text(taskString)
          ),
        )
      ],
    ),
  );

  var listView2 = ListView.separated(
    padding : const EdgeInsets.all(8),
    itemCount : taskList.length,
    itemBuilder: (BuildContext buildContext,int index){
      return _createListItem1(taskList[index]);
    },
    separatorBuilder: (BuildContext buildContext,int index) => const Divider(),
  );

}
