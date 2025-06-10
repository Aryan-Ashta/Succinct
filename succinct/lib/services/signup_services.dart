import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//returns the credential from a new sign up given email and passwords
Future<UserCredential> signUpWithEmail(email, password, context) async {
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    log('Signup Completed');
    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Signup Successful'),
          content: Text('Welcome!'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    return credential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      log('Password is too weak');
      showDialog(
        context: context, 
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Signup Failed'),
            content: Text('The password provided is too weak. Please choose a stronger password.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
      );
    } else if (e.code == 'email-already-in-use') {
      log('An account already exists for this email');
      showDialog(
        context: context, 
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Signup Failed'),
            content: Text('An account already exists for this email. Please log in instead.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
      );
    }
    rethrow;
  } catch (e) {
    log(e.toString());
    rethrow;
  }
}