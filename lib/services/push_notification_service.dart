import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging();
  Future initialise(BuildContext context) async {
    if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }
    _fcm.subscribeToTopic("general");
    //print("Token is:" + _fcm.getToken().toString());
    print("Token is: " + await _fcm.getToken());
    _fcm.configure(
      //Called when your app is in the foreground and you recieve a push-notification
      onMessage: (Map<String, dynamic> message) async {
        print("Message: $message");
        showAlertDialog(
            message['notification']['title'] != null
                ? message['notification']['title']
                : "NULL",
            message['notification']['body'] != null
                ? message['notification']['body']
                : "NULL",
            context);
      },
      //Called when your app is closed and you recieve a push-notification
      onLaunch: (Map<String, dynamic> message) async {
        print("Message: $message");
      },
      //Called when your app is running in the background and you recieve a push-notification
      onResume: (Map<String, dynamic> message) async {
        print("Message: $message");
      },
    );
  }
}

Future<void> showAlertDialog(
    String title, String message, BuildContext context) {
  return (showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 24.0, fontFamily: 'Circular'),
          backgroundColor: Theme.of(context).primaryColor,
          content: Text(
            message,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        );
      }));
}
