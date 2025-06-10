//feed the credential in here and get user attributes and pass to model

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';



late bool isLoggedIn;

authChangeListener(bool isLoggedIn) {
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      isLoggedIn = false;
      log('User is currently signed out!');
    } else {
      isLoggedIn = true;
      log('User is signed in!');
    }
  });
}

