import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mainpage extends StatelessWidget {
  mainpage(){
    taskList.add("taskList.add");
  }
  @override
  Widget build(BuildContext context) {
    addTask("taskList.add");
    return Column(
      children: [
        Expanded(
          child: listView2,
        ),
        buttonNavigation
      ],
    );
  }

  static addTask (String taskText){
    taskList.add(taskText);
  }

  static int taskId = 0;
  onPressAddTask(){
    taskId++;
    addTask("hello "+taskId.toString());
  }


  var buttonNavigation = Container(
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
            onTap: (){
              taskId++;
              addTask("hello "+taskId.toString());
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
  static List<String> taskList = <String>["Leisure","What is this life if, full of care","We have no time to stand and stare"];

  var listView2 = ListView.separated(
    padding : const EdgeInsets.all(8),
    itemCount : taskList.length,
    itemBuilder: (BuildContext buildContext,int index){
      return _createListItem1(taskList[index]);
    },
    separatorBuilder: (BuildContext buildContext,int index) => const Divider(),
  );
  var listView1 = ListView(
    padding: const EdgeInsets.all(8),
    children: [
      _createListItem1("hello task 1"),
      Divider(),
      _createListItem1("hello task 1"),
      Divider(),
      _createListItem1("hello task 1"),
      Divider(),
      _createListItem1("hello task 1"),
      Divider(),
      _createListItem1("hello task 1"),
      Divider(),
      _createListItem1("hello task 1"),
      Divider(),
      _createListItem1("hello task 1"),
      Divider(),
      _createListItem1("hello task 1"),
      Divider(),
      _createListItem1("hello task 1"),
      Divider(),
      _createListItem1("hello task 1"),
      Divider(),
      _createListItem1("hello task 1"),
      Divider(),
      _createListItem1("hello task 1"),
      Divider(),
      _createListItem1("hello task 1"),
      Divider(),
      _createListItem1("hello task 1"),
      Divider(),
      _createListItem1("hello task 1"),
      Divider(),
      _createListItem1("hello task 1"),
      Divider(),
      _createListItem1("hello task 1"),
      Divider(),
      _createListItem1("hello task 1"),
      Divider(),

    ],
  );

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
  /*
  var bottomNav = Row(
      children: [
        Text("Menu 1"),
        Text("Add Button"),
        Text("Menu 2"),
      ]
  );

  var listItem1 = Row(
    children: [
      Text("leading"),
      Text("task text"),
    ]
  );// Row -> List Item

  var container = Container(
      color : Colors.red,
      child : Column(
        children: [
          Container(
              color: Colors.blue,
              child : Text('blue')
          ),
          Container(
              color: Colors.green,
              child : Text('green')
          )
        ],
      )
  );
  */
}
