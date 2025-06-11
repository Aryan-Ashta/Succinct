import 'dart:developer';

import 'package:firebase_ai/firebase_ai.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

ChatSession chatInstance() {
  final model = FirebaseAI.googleAI().generativeModel(model: 'gemini-2.0-flash');
  final chat = model.startChat();
  return chat;
}
String chunks = '';
//need to add stucuted json output based on syuncfusion calendar events
Stream<String> chatResponseStream(chatInstance, prompt, uid, chunks) async*{
  final response = await chatInstance.sendMessage(prompt);
  
  CollectionReference promptResponses = FirebaseFirestore.instance.collection('promptRepsonses');
  int index=0;
  await for (final chunk in response){
    index++;
    chunks = chunks + chunk;
    promptResponses.add({
      'uid': uid,
      'prompt':prompt,
      'date': DateTime.now(),
      'chunkOfResponse':chunk,
      'index':index,
  })
    .then((value) => log(''));
    yield chunks;
  }
}

Future<String> dechunkResponse(prompt, uid) async{
  
  String response = '';

  CollectionReference promptRepsonses = FirebaseFirestore.instance.collection('promptResponses');

  promptRepsonses
    .where('uid'==uid)
    .where('prompt'==prompt)
    .orderBy('index')
    .get()
    .then((QuerySnapshot snapshot) {
      for (var doc in snapshot.docs) {
        response = response + doc['chunkOfResponse'];
        log(doc.toString());
      }
    });
  return response;
}

