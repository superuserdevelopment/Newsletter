import 'package:flutter/material.dart';
import 'package:newsletter/services/auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthenticationService _auth = AuthenticationService();
  final _formKey = GlobalKey<FormState>();

  bool _emailFocus = false;
  bool _passFocus = false;
  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  "Welcome back!",
                  style: TextStyle(fontSize: 26.0),
                ),
                Text(
                  "Please Login/Sign-up to continue",
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            //email
                            Card(
                              elevation: _emailFocus ? 10.0 : 0.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              color: Theme.of(context).primaryColor,
                              child: Container(
                                padding:
                                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
                                child: TextFormField(
                                  onTap: () {
                                    setState(() {
                                      _emailFocus = true;
                                      _passFocus = false;
                                    });
                                  },
                                  validator: (val) => val.isEmpty
                                      ? 'Enter a valid email address'
                                      : null,
                                  cursorColor: Theme.of(context).accentColor,
                                  decoration: InputDecoration(
                                      hintText: 'Email Address',
                                      hintStyle: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 20.0),
                                      errorStyle: TextStyle(
                                          color: Colors.white, fontSize: 12.0),
                                      errorBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green)),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[600])),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white))),
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                  onChanged: (val) {
                                    setState(() {
                                      _email = val;
                                    });
                                  },
                                ),
                              ),
                            ),
                            //email ends
                            SizedBox(
                              height: 20.0,
                            ),
                            //password
                            Card(
                              elevation: _passFocus ? 10.0 : 0.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              color: Theme.of(context).primaryColor,
                              child: Container(
                                padding:
                                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
                                child: TextFormField(
                                  onTap: () {
                                    setState(() {
                                      _emailFocus = false;
                                      _passFocus = true;
                                    });
                                  },
                                  validator: (val) => val.length > 5
                                      ? null
                                      : 'Enter a password with 6 or more characters',
                                  cursorColor: Colors.white,
                                  decoration: InputDecoration(
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 20.0),
                                      errorStyle: TextStyle(
                                          color: Colors.white, fontSize: 12.0),
                                      errorBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green)),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[600])),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white))),
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                  obscureText: true,
                                  onChanged: (val) {
                                    setState(() {
                                      _password = val;
                                    });
                                  },
                                ),
                              ),
                            ),
                            //password ends
                            SizedBox(
                              height: 20.0,
                            ),
                            //Login/Sign-up Buttons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                //Login Button
                                RaisedButton(
                                  splashColor: Colors.white,
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      print(_email);
                                      print(_password);
                                      setState(() {
                                        //loading = true;
                                      });
                                      dynamic result = await _auth.signInEmail(
                                          _email, _password);

                                      if (result.runtimeType == String) {
                                        showAlertDialog(
                                            'Oops', result, context);
                                        setState(() {
                                          //loading = false;
                                        });
                                      } else {
                                        // Navigator.popAndPushNamed(
                                        //     context, '/home');

                                        // await DatabaseService(
                                        //         uid: result.uid)
                                        //     .updateUserData(
                                        //         name, email);
                                      }
                                    }
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0))),
                                  color: Theme.of(context).primaryColor,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18.0),
                                  ),
                                ),
                                //Sign-up Button
                                RaisedButton(
                                  splashColor: Colors.white,
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      print(_email);
                                      print(_password);
                                      setState(() {
                                        //loading = true;
                                      });
                                      dynamic result = await _auth
                                          .registerWithEmail(_email, _password);

                                      if (result.runtimeType == String) {
                                        showAlertDialog(
                                            'Oops', result, context);
                                        setState(() {
                                          //loading = false;
                                        });
                                      } else {
                                        showAlertDialog('Success',
                                            "Successfully Registered", context);
                                        // Navigator.popAndPushNamed(
                                        //     context, '/home');
                                        // await DatabaseService(
                                        //         uid: result.uid)
                                        //     .updateUserData(
                                        //         name, email);
                                      }
                                    }
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0))),
                                  color: Theme.of(context).primaryColor,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Text(
                                    "Sign-up",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18.0),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18.0),
                            )
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
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
