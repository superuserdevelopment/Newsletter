import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging();
  Future initialise() async {
    if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }
    print(_fcm.getToken().toString());
    _fcm.configure(
      //Called when your app is in the foreground and you recieve a push-notification
      onMessage: (Map<String, dynamic> message) async {
        print("Message: $message");
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
