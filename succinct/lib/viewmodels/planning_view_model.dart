//call gemini here to generate the planning view model
//each chat will be a different block 
import 'package:flutter/material.dart';
import 'package:succinct/services/account_services.dart';
import 'package:succinct/services/planning_services.dart';

class ChatBlock extends StatefulWidget{
  const ChatBlock({super.key});

  @override
  ChatBlockState createState() => ChatBlockState();
}

class ChatBlockState extends State<ChatBlock> {
  
            
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        // Add more widgets here to represent the chat block
        // For example, a list of messages, input field, etc.
      ],
    );
  }
}

class Chat extends StatefulWidget {
  const Chat({super.key});
  
  @override
  ChatState createState() => ChatState();
}

class ChatState extends State<Chat> {
  final model = geminiInstance();
  String? prompt;
  String? uid ;
  
  @override
  void initState() {
    super.initState();
    StreamBuilder<String>(
      stream: chatResponseStream(model, prompt, uid, isDone),
      builder: (context, snapshot) {
        return Text(snapshot.data ?? ''); // Show a loading indicator while waiting for data
      },
    );
    StreamBuilder<String>(
      stream: userDataListener(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          uid = snapshot.data; // Update the uid with the user data
        }
        return Text(''); // Show a loading indicator while waiting for user data
      },
    );
    // Initialize any necessary data or state here
  }
  //call the stream and the use the swap to get the full response
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        TextField(
          decoration: InputDecoration(
            labelText: 'Type your message',
            border: OutlineInputBorder(),
          ),
          onSubmitted: (String message) {

          },
        ),
      ],
    );
  }
}