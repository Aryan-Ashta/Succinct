//store the user data here, call the login functions and other services
//returns the user id as a string given the credential
import 'package:firebase_auth/firebase_auth.dart';

Future<String?> returnUID(UserCredential credential) async{
  final user = credential.user;
  return user?.uid;
}

class AppUser {
  final String uid;
  final String email;
  final String displayName;

  AppUser({required this.uid, required this.email, required this.displayName});

  factory AppUser.fromFirebase(User user) {
    return AppUser(
      uid: user.uid,
      email: user.email ?? '',
      displayName: user.displayName ?? '',
    );
  }
}
