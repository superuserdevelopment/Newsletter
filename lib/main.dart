import 'package:flutter/material.dart';
import 'package:newsletter/pages/home.dart';
import 'package:newsletter/pages/login.dart';
import 'package:newsletter/services/auth.dart';
import 'package:newsletter/services/wrapper.dart';
import 'package:newsletter/userModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthenticationService().user,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Circular',
            textTheme: Theme.of(context).textTheme.apply(
                fontFamily: 'Circular',
                bodyColor: Colors.white,
                displayColor: Colors.white),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routes: {
            '/': (context) => Wrapper(),
            '/home': (context) => HomePage(),
            '/login': (context) => LoginPage(),
          },
          initialRoute: '/',
        ));
  }
}
