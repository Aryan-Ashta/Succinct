import 'dart:developer';

import 'package:firebase_ai/firebase_ai.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

GenerativeModel geminiInstance() {
  final model = FirebaseAI.googleAI().generativeModel(model: 'gemini-2.0-flash');
  return model;
}

bool? isDone;
//need to add stucuted json output based on syuncfusion calendar events
Stream<String> chatResponseStream(model, prompt, uid,  isDone) async*{
  final response = await model.generateContentStream(prompt);
  String chunks = '';
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
  isDone = true;
}

String dechunkResponse(prompt, uid) {
  
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

//when the user creates a new chatResponseStream, it should swap chunks for response using isDone to check
String swapResponse(isDone, prompt, uid){
  if (isDone == true) {
    return dechunkResponse(prompt, uid);
  } else {
    return '';
  }
}