//somthing to call the firesotre collection with calendarer events

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:succinct/services/account_services.dart';

class Events {
  final String? subject;
  final String? startTime;
  final String? endTime;
  final String? prompt;
  final String? uid;

  Events({
    this.subject,
    this.startTime,
    this.endTime,
    this.prompt,
    this.uid, 
  });
  
  factory Events.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Events(
      subject: data?['subject'],
      startTime: data?['startTime'],
      endTime: data?['endTime'],
      prompt: data?['prompt'],
      uid: data?['uid'],
    );
  }

  Map<String,dynamic> toFirestore(){
    return{
      "subject": subject,
      "startTime": startTime,
      "endTime": endTime,
      "prompt": prompt,
      "uid": uid
    };
  }
}
//adds an event to firestore
Future<void> addEvent(Events event) async {
    final eventsRef = FirebaseFirestore.instance.collection("calendarEvents");
    await eventsRef.add(event.toFirestore());
}

//turn into a stream
Stream<List<Events>> getEvents(Events event) async*{
  String? uid;
  final stream = userDataListener();
  await for (final value in stream){
    uid = value;
  }
  final eventsRef = FirebaseFirestore.instance.collection("calendarEvents");
  final query = eventsRef.where("uid", isEqualTo: uid);
  final querySnapshot = await query.get();
  List<Events> eventList = [];
  
  for (var item in querySnapshot.docs){
    final ref = FirebaseFirestore.instance.collection("calendarEvents").doc(item.id).withConverter(
      fromFirestore: Events.fromFirestore, 
      toFirestore: (Events event, _) => event.toFirestore(),
    );
    final docSnap = await ref.get();
    final event = docSnap.data();
    eventList.add(event!);
  }

  yield eventList;
}