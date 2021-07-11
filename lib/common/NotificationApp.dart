import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationApp extends StatefulWidget {
  const NotificationApp({Key? key}) : super(key: key);

  @override
  _NotificationAppState createState() => _NotificationAppState();
}

class _NotificationAppState extends State<NotificationApp> {
  late FlutterLocalNotificationsPlugin localNotifications;

  @override
  void initState() {
    super.initState();
    var androidInitialize = AndroidInitializationSettings('ic_launcher');
    var iOSInitialize = IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: androidInitialize, iOS: iOSInitialize);
    localNotifications = new FlutterLocalNotificationsPlugin();
    localNotifications.initialize(initializationSettings);
  }

  Future _showNotification() async {
    var androidDetails = new AndroidNotificationDetails('channelId',
        'Apply Job Success', 'Your cv is already sent to company!');
    var iOSDetails = new IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(android: androidDetails, iOS: iOSDetails);
    await localNotifications.show(
        0,
        'Job apply success',
        'Your application is already sent to company!',
        generalNotificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
