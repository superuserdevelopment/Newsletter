import 'package:flutter/material.dart';
import 'package:newsletter/services/push_notification_service.dart';
import 'package:provider/provider.dart';
import 'package:newsletter/pages/home.dart';
import 'package:newsletter/pages/login.dart';
import 'package:newsletter/userModel.dart';

class Wrapper extends StatelessWidget {
  final PushNotificationService _notificationService =
      PushNotificationService();
  @override
  Widget build(BuildContext context) {
    _notificationService.initialise();
    final user = Provider.of<User>(context);
    print(user);
    if (user != null) {
      return HomePage();
    } else {
      return LoginPage();
    }
  }
}
