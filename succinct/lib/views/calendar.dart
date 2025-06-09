import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


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
          SfCalendar(
            view: CalendarView.month,
            monthViewSettings: MonthViewSettings(showAgenda: true),
            allowDragAndDrop: true,
            allowAppointmentResize: true,
            allowViewNavigation: true,
          )
      ]),
      drawer: Drawer(
              ),
    );
  }
}