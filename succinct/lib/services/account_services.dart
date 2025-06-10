import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//returns the credential from a sign in given email and passwords
//call this function in the login view
Future<UserCredential> signInWithEmail(email,password,context) async{
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    log('Signup Completed');
    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login Successful'),
          content: Text('Welcome back!'),
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
    if (e.code == 'user-not-found') {
      log(e.code);
      showDialog(
        context: context, 
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('No user found for that email. Please sign up first.'),
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
    } else if (e.code == 'wrong-password') {
      log('Wrong password provided for that user');
      showDialog(
        context: context, 
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Wrong password provided for that user. Please try again.'),
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

