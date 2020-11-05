import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todolist/main.dart';
import 'package:todolist/ui/NotificationReceiverRoute.dart';

import 'package:http/http.dart' as http;

/* import ကတော့ လုပ်တာပဲ မို့လား ၊ ဒါပေမယ့် ဒီကောင်တွေက တစ်မျိုး static လည်း ကြေညာထားတာ မရှိပါပဲ ဟိုဘက် မှာ initizlize လုပ်ထားမှ ဒီဘက်မှာ သုံးလို့ရတာမျိုး , TimeZone noted */
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class MainNotification extends StatefulWidget {

  final NotificationAppLaunchDetails notificationAppLaunchDetails;
  bool get didNotificationLaunchApp =>
      notificationAppLaunchDetails?.didNotificationLaunchApp ?? false;

  const MainNotification(
      this.notificationAppLaunchDetails, {
        Key key,
      }) : super(key: key);

  @override
  _MainNotificationState createState() => _MainNotificationState();
}

class _MainNotificationState extends State<MainNotification> {

  @override
  void initState() {
    super.initState();
    _requestPermissions();
    _configureDidReceiveLocalNotificationSubject();
    _configureSelectNotificationSubject();
  }

  void _requestPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        MacOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  void _configureDidReceiveLocalNotificationSubject() {
    didReceiveLocalNotificationSubject.stream
        .listen((ReceivedNotification receivedNotification) async {
      await showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: receivedNotification.title != null
              ? Text(receivedNotification.title)
              : null,
          content: receivedNotification.body != null
              ? Text(receivedNotification.body)
              : null,
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () async {
                Navigator.of(context, rootNavigator: true).pop();
                await Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        NotificationReceiverRoute(receivedNotification.payload),
                  ),
                );
              },
              child: const Text('Ok'),
            )
          ],
        ),
      );
    });
  }

  void _configureSelectNotificationSubject() {
    selectNotificationSubject.stream.listen((String payload) async {
      print("selectNotificationSubject "+payload);
      print("call NotificationReceiverRoute");
      await Navigator.push(
        context,
        MaterialPageRoute<void>(
            builder: (BuildContext context) => NotificationReceiverRoute(payload)),
      );
    });
  }

  @override
  void dispose() {
    didReceiveLocalNotificationSubject.close();
    selectNotificationSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title : Text("Hello Notification")
        ),
        body: ListView(
          children: [
            Center(
              child: RaisedButton(
                child: Text("Show Simple Notification"),
                onPressed:(){
                  print("start _ShowNotificaiton");
                  _ShowNotification();
                  print("end notificaiton?");
                },
              ),
            ),
            Center(
              child: RaisedButton(
                child: Text("Show Big Notification"),
                onPressed:(){
                  print("start _ShowNotificaiton");
                  _showBigPictureNotification();
                  print("end notificaiton?");
                },
              ),
            ),
            Center(
              child: RaisedButton(
                child: Text("Notify at 10 AM"),
                onPressed:(){
                  print("notify at 10 am");
                  _scheduleDailyTenAMNotification();
                },
              ),
            ),
            Center(
              child: RaisedButton(
                child: Text("Custom Daily notification"),
                onPressed:(){
                  print("custom daily notification");
                  _nextScheduleTimeInstance();
                  _nextScheduleTimeInstance(hour: 23,minute: 59);
                },
              ),
            ),
            Center(
              child: RaisedButton(
                child: Text("Every Minute"),
                onPressed:(){
                  print("every minute notification");
                  _repeatNotification();
                },
              ),
            ),
            Center(
              child: RaisedButton(
                child: Text("Cancel Notification"),
                onPressed:(){
                  print("cancel  notification");
                  _cancelNotification();
                },
              ),
            ),
          ]
        ),

      ),
    );
  }

  Future<void> _ShowNotification() async{
    print("_ShowNotificaiton");
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        'channel id', 'channel name', 'channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, 'plain title', 'plain body', platformChannelSpecifics,
        payload: 'item x');
  }

  Future<String> _downloadAndSaveFile(String url, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory(); // path provider က စီမံပေးတာ
    final String filePath = '${directory.path}/$fileName';
    http.Response response;
    try{
      //final http.Response
       response = await http.get(url); // ထုံးစံအတိုင်း http module ပေါ့ဗျာ
    }
    catch(exp){
      print("http error in _downloadAndSaveFile "+exp.toString());
      return filePath;
    }
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

  Future<void> _showBigPictureNotification() async {
    final String largeIconPath = await _downloadAndSaveFile(
        'http://via.placeholder.com/48x48', 'largeIcon');
    final String bigPicturePath = await _downloadAndSaveFile(
        'http://via.placeholder.com/400x800', 'bigPicture');
    final BigPictureStyleInformation bigPictureStyleInformation =
    BigPictureStyleInformation(FilePathAndroidBitmap(bigPicturePath),
        largeIcon: FilePathAndroidBitmap(largeIconPath),
        contentTitle: 'overridden <b>big</b> content title',
        htmlFormatContentTitle: true,
        summaryText: 'summary <i>text</i>',
        htmlFormatSummaryText: true);
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails('2',
        'channel1_name', 'channel1_description',
        styleInformation: bigPictureStyleInformation);
    final NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        1, 'big text title', 'silent body', platformChannelSpecifics,
        payload: 'item x big Image');
  }


  /* zonedSchedule ဆိုတာက repeat ထပ်မယ် ဆိုတဲ့ သဘော */
  Future<void> _scheduleDailyTenAMNotification() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'daily scheduled notification title',
        'daily scheduled notification body',
        _nextInstanceOfTenAM(),
        const NotificationDetails(
          android: AndroidNotificationDetails(
              'daily notification channel id',
              'daily notification channel name',
              'daily notification description'),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time); // matchDateTimeComponents ဆိုတာက daily/ weekly/ monthly or by time series...
        // DatetimeComponents.time ဆိုရင် အချိန်အပိုင်းအခြားနဲ့၊ dayOfWeekAndTime ဆိုရင် အပတ်စဉ် အချိန်နဲ့ :D
  }


  tz.TZDateTime _nextInstanceOfTenAM() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
    tz.TZDateTime(tz.local, now.year, now.month, now.day, 8,42);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  tz.TZDateTime _nextScheduleTimeInstance({int year = 0, int month = 0, int day = 0, int hour = 0, int minute = 0, int second = 0}) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    print("_nextScheduleTimeInstance " +
        "\n year\t:\t" + ((year == 0 ) ? now.year : year).toString()+
        "\n month\t:\t" + ((month == 0 ) ? now.month : month).toString()+
        "\n day  \t:\t" + ((day == 0 ) ? now.day : day).toString()+
        "\n hour\t:\t" + ((hour == 0 ) ? now.hour : hour).toString()+
        "\n minute\t:\t" + ((minute == 0 ) ? now.minute : minute).toString()+
        "\n second\t:\t" + ((second == 0 ) ? now.second : second).toString()
    );
    /*
    tz.TZDateTime scheduledDate = tz.TZDateTime(
        tz.local,
      (year == 0 ) ? now.year : year,
        now.month,
    );
     */
  }


  Future<void> _repeatNotification() async {
    print("_repeatNotification...");
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails('repeating channel id',
        'repeating channel name', 'repeating description');
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.periodicallyShow(0, 'repeating title',
        'repeating body', RepeatInterval.everyMinute, platformChannelSpecifics,
        androidAllowWhileIdle: true);
  }

  Future<void> _cancelNotification() async {
    print("_cancelNotification");
    await flutterLocalNotificationsPlugin.cancel(0);
  }

}


