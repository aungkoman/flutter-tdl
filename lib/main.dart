import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:todolist/datastructure/customDrawer.dart';
import 'package:todolist/datastructure/listTile.dart';
import 'package:todolist/package/helloworld.dart';
import 'package:todolist/routing/FirstRoute.dart';
import 'package:todolist/routing/SecondRoute.dart';
import 'package:todolist/ui/MainNotification.dart';
import 'package:todolist/ui/mainpage.dart';
import 'package:todolist/ui/mmcafe.dart';
import 'package:todolist/ui/tasklist.dart';
import 'ChatApp.dart';
import 'MainApp.dart';
import 'datastructure/gridview.dart';
import 'package/helloworld.dart';
import 'ui/socketIo.dart';



import 'package:rxdart/subjects.dart';
//import 'package:timezone/data/latest.dart' as tz;
//
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

/// Streams are created so that app can respond to notification-related events
/// since the plugin is initialised in the `main` function
final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
BehaviorSubject<ReceivedNotification>();

final BehaviorSubject<String> selectNotificationSubject =
BehaviorSubject<String>();

const MethodChannel platform =
MethodChannel('dexterx.dev/flutter_local_notifications_example');

class ReceivedNotification {
  ReceivedNotification({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.payload,
  });

  final int id;
  final String title;
  final String body;
  final String payload;
}



Future<void> main() async {
  //WidgetsFlutterBinding.ensureInitialized();

// needed if you intend to initialize in the `main` function
  WidgetsFlutterBinding.ensureInitialized();

  // ဒေသစံတော်ချိန် ကိုက်ညီဖို့အတွက် Time Zone တွေ ပြင်ထားပေးရမယ် မဖြစ်မနေ
  await _configureLocalTimeZone();

  final NotificationAppLaunchDetails notificationAppLaunchDetails =
  await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('app_icon');

  /// Note: permissions aren't requested here just to demonstrate that can be
  /// done later
  final IOSInitializationSettings initializationSettingsIOS =
  IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) async {
        didReceiveLocalNotificationSubject.add(ReceivedNotification(
            id: id, title: title, body: body, payload: payload));
      });
  const MacOSInitializationSettings initializationSettingsMacOS =
  MacOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false);
  final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      macOS: initializationSettingsMacOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
        if (payload != null) {
          debugPrint('notification payload: $payload');
        }
        selectNotificationSubject.add(payload);
      });

  runApp(
      MaterialApp(
        home: MainNotification(
          notificationAppLaunchDetails,
        ),
      ) // To fix contex issue :D
  ); // runApp

}



Future<void> _configureLocalTimeZone() async {
  tz.initializeTimeZones();
  /* အခုထိ Rangoon နေတုန်းပဲ  , platform ကတော့ Asia/Yangon ထုတ်ပေးတယ် ဒါပေမယ့် timezone က မသိသေးဘူး Yangon ကို */
  final String timeZoneName = "Asia/Rangoon";
  //final String timeZoneName = await platform.invokeMethod('getTimeZoneName');
  //print("zone name is "+timeZoneName);
  tz.setLocalLocation(tz.getLocation(timeZoneName));
}

//
// // #docregion MyApp
// class MyApp extends StatelessWidget {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter layout demo',
//       initialRoute: '/',
//       /* this is routing table */
//       routes: {
//         // '/' : (context) => MainApp(),
//         '/' : (context) => FirstRoute(),
//         SecondRoute.routeName : (context) => SecondRoute(),
//         // MainApp.routeName : (context) => MainApp(),
//         // '/chat' : (context) => ChatApp(),
//         ChatApp.routeName : (context) => ChatApp(),
//       },
//     );
//   }
//
// }