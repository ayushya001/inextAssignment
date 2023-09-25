
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inext_assignment/Pages/HomePage.dart';

import '../Utils/generalUtils.dart';

class Authprovider extends ChangeNotifier {

  final currentUser = FirebaseAuth.instance.currentUser;


  bool _loading = false;

  bool get loading => _loading;

  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void Loginn(BuildContext context, String email, String password) async {
    setloading(true);

    try {

      FirebaseAuth _auth = FirebaseAuth.instance;
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
      setloading(false);

      // User successfully logged in, you can navigate to another screen here.
    } catch (e) {
      // Handle login errors (e.g., invalid credentials, user not found).
      print(e.toString());
      setloading(false);

      Utils.flushBarErrorMessage('please enter the hint username and password', context);
    }
  }
}