import 'package:flutter/material.dart';
import 'package:succinct/viewmodels/calendarViewModel.dart';


class CalendarRoute extends StatelessWidget {
  const CalendarRoute({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: Stack(
        children: <Widget>[
          Text(
            'Calendar Route'
            
          ),
        calendar()
          
      ]),
      drawer: Drawer(
              ),
    );
  }
}