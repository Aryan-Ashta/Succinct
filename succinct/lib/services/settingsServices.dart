import 'package:firebase_auth/firebase_auth.dart';

Future<void> updateUsername(user, newName) async{
  await user?.updateDisplayName(newName);
}
