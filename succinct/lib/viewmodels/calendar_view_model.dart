
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';
//converts events from the events service to a calendar data source

Future<AppointmentDataSource> getCalendarDataSource(appointments) async{
  List<Appointment> appointmentList = <Appointment>[];
  List eventsList = await appointments.getEvents();
  for (var event in eventsList){
    appointmentList.add(Appointment(
      subject: event.subject,
      startTime: event.startTime, 
      endTime: event.endTime,
      color: event.colour,
    ));
  }
  appointmentList.add(Appointment(
    startTime: DateTime.now(),
    endTime: DateTime.now().add(Duration(minutes: 10)),
    subject: 'Meeting',
    color: const Color.fromARGB(255, 255, 170, 0),
    startTimeZone: '',
    endTimeZone: '',
  ));

  return Future<AppointmentDataSource>(appointments);
}

class AppointmentDataSource extends CalendarDataSource{
  AppointmentDataSource(List<Appointment> source){
    appointments=source;
  }
  
}

