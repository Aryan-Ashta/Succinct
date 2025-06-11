//call gemini here to generate the planning view model
//each chat will be a different block 
import 'package:flutter/material.dart';
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
  final String chatId;

  const Chat({super.key, required this.chatId});

  @override
  ChatState createState() => ChatState();
}

class ChatState extends State<Chat> {
  
  
  
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