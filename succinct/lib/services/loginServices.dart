import 'package:firebase_auth/firebase_auth.dart';
//returns the credential from a new sign up given email and passwords
Future<UserCredential> signUpWithEmail(email, password) async {
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    print('Signup Completed');
    return credential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('Password is too weak');
    } else if (e.code == 'email-already-in-use') {
      print('An account already exists for this email');
    }
    rethrow;
  } catch (e) {
    print(e);
    rethrow;
  }
}
//returns the credential from a sign in given email and passwords
Future<UserCredential> signInWithEmail(email,password) async{
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    print('Signup Completed');
    return credential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('Password is too weak');
    } else if (e.code == 'email-already-in-use') {
      print('An account already exists for this email');
    }
    rethrow;
  } catch (e) {
    print(e);
    rethrow;
  }
}

//returns the user id as a string given the credential
Future<String> returnUID(credential) async{
  final user = credential.user;
  return user?.uid;
}
