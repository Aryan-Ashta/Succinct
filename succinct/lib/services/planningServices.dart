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

