import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsletter/userModel.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //Converts FirebaseUser object to custom User Object
  User _convertUser(FirebaseUser user) {
    return (user != null ? User(uid: user.uid) : null);
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_convertUser);
  }

  //Sign in Anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _convertUser(user);
    } catch (e) {
      //print(e.toString());
      print('Error:');
      return (null);
    }
  }

  //Register with email and password
  Future registerWithEmail(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _convertUser(user);
    } catch (e) {
      print('Registration Error');
      print(e.message);
      return e.message;
    }
  }

  //Sign in with email and password
  Future signInEmail(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _convertUser(user);
    } catch (e) {
      print('Sign-in Error');
      print(e);
      return e.message;
    }
  }

  //Sign out
  Future signOut() async {
    try {
      await _auth.signOut();
      print('Signed Out');
    } catch (e) {
      print(e);
    }
  }
}
