import 'package:firebase_ai/firebase_ai.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

ChatSession chatInstance() {
  final model = FirebaseAI.googleAI().generativeModel(model: 'gemini-2.0-flash');
  final chat = model.startChat();
  return chat;
}
//need to add stucuted json output based on syuncfusion calendar events
Future<void> chatResponseStream(chatInstance, prompt, uid) async{
  final response = await chatInstance.sendMessage(prompt);
  CollectionReference promptResponses = FirebaseFirestore.instance.collection('promptRepsonses');
  int index=0;
  await for (final chunk in response){
    index++;
    return promptResponses.add({
      'uid': uid,
      'prompt':prompt,
      'date': DateTime.now(),
      'chunkOfResponse':chunk,
      'index':index
  })
    .then((value) => print("response stored"));
  }
}

Future<void> dechunkResponse(prompt, uid) async{
  CollectionReference promptRepsonses = FirebaseFirestore.instance.collection('promptResponses');

  return promptRepsonses.where('uid'==uid).where('prompt'==prompt).get()
    .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        //add a piece that takes each prompt chunk, sorts them, puts them togeth in one completed repsonses doc and then deletes the original doc
      });
    });
}