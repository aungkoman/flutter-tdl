
import 'package:flutter/material.dart';


class NotificationReceiverRoute extends StatefulWidget {
  const NotificationReceiverRoute(
      this.payload, {
        Key key,
      }) : super(key: key);

  final String payload;

  @override
  State<StatefulWidget> createState() => NotificationReceiverRouteState();
}

class NotificationReceiverRouteState extends State<NotificationReceiverRoute> {
  String _payload;
  @override
  void initState() {
    super.initState();
    _payload = widget.payload;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Payload : ${_payload ?? ''}'),
    ),
    body: Center(
      child: RaisedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Voilà'),
      ),
    ),
  );
}

