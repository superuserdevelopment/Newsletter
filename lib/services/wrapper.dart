import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:newsletter/pages/home.dart';
import 'package:newsletter/pages/login.dart';
import 'package:newsletter/userModel.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if (user != null) {
      return HomePage();
    } else {
      return LoginPage();
    }
  }
}
