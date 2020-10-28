import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';
class mmcafe extends StatefulWidget {
  @override
  _mmcafeState createState() => _mmcafeState();
}

class _mmcafeState extends State<mmcafe> {

  final List<String> messageList = <String>["hello","What is this life if, full of care.","hi","how are you","fine, and you?"];

  final TextEditingController messageTextEditingController = new TextEditingController();
  final ScrollController messageListScrollController = new ScrollController();

  void _receiveMessage(String msg){
    setState(() {
      messageList.add(msg);
    });
    scrollToBottom();
  }

  Socket socket;
  @override
  void initState() {
    print("initState");
    //Creating the socket
    socket = io('https://shan-server.herokuapp.com/', <String, dynamic>{
      'transports': ['websocket'],
    });
    socket.connect();

    socket.on('connect',(_){
      print("socket connected");
      socket.emit('flutter',"Hello from flutter");
    });

    socket.on('connect_error',(_){
      print("socket connect error ");
      print(_.toString());
    });

    socket.on('flutter',(msg){
      print("socket on flutter event received");
      print(msg);
      _receiveMessage(msg);
    });
  }


  @override
  void dispose(){
    messageTextEditingController.dispose();
    messageListScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: messageListView()),
        messageInputBox(),
      ],
    );
  }

  void sendMessage(){
    String msg = messageTextEditingController.text;
    if(messageTextEditingController.text.length == 0 ) return;
    /*
    setState(() {
      if(messageTextEditingController.text.length > 0 ){
        messageList.add(messageTextEditingController.text);
        messageTextEditingController.clear();
        scrollToBottom();
      }
    });
    */
    messageTextEditingController.clear();
    socket.emit('flutter',msg);
  }
  void scrollToBottom(){
    messageListScrollController.animateTo(
        messageListScrollController.position.maxScrollExtent+100,
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn
    );
  }
  Widget messageListView() => ListView.separated(
      controller: messageListScrollController,
      itemBuilder: (BuildContext buildContext, int index){
        //return Center(child: Text(index.toString()));
        return Container(
          padding: EdgeInsets.all(8),
          color: Colors.blueAccent,
          child: Text(messageList[index]),
        );
      },
      separatorBuilder: (BuildContext buildContext, int index){
        return Divider(
          height: 10,
          thickness: 5,
          indent: 20,
          endIndent: 20,
        );
      },
      itemCount: messageList.length
  );


  Widget messageInputBox() => Container(
    //color: Colors.redAccent,
    child: TextField(
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: 3,
      controller: messageTextEditingController,
      textInputAction: TextInputAction.newline,
      decoration: InputDecoration(
        labelText : "Message",
        prefixIcon: Icon(Icons.message,color: Colors.blue,),
        suffixIcon: IconButton(
          onPressed: (){
            print("suffixIcon onPressed and clear input");
            sendMessage();
          },
          icon: Icon(Icons.send,color:Colors.blue),
        ),
        hintText: "Type your message here",
      ),
    ),
  );
}
