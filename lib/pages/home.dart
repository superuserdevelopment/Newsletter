import 'package:flutter/material.dart';
import 'package:newsletter/services/auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weekly Newsletter",
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              AuthenticationService _auth = AuthenticationService();
              _auth.signOut();
            },
            icon: Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: Center(),
    );
  }
}
