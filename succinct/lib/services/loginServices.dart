import 'package:firebase_auth/firebase_auth.dart';


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

Future<UserCredential> signInWithGoogle() async{
  GoogleAuthProvider googleProvider = GoogleAuthProvider();
  googleProvider.setCustomParameters({
    'login-hint':'user@example.com'
  });
  return await FirebaseAuth.instance.signInWithPopup(googleProvider);
}

