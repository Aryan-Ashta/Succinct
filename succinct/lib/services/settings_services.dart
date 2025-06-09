Future<void> updateUsername(user, newName) async{
  await user?.updateDisplayName(newName);
}