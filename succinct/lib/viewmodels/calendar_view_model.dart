import 'package:succinct/services/calendar_services.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';

Future<SfCalendar> calendar()  async{
  return SfCalendar(
    view: CalendarView.month,
    allowDragAndDrop: true,
    dataSource:  await _getCalendarDataSource(Events().getEvents()),
    monthViewSettings: MonthViewSettings(
      showAgenda: true,
      dayFormat: 'EEE',

    ),

  );
}

Future<_AppointmentDataSource> _getCalendarDataSource(appointments) async{
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

  return Future<_AppointmentDataSource>(appointments);
}

class _AppointmentDataSource extends CalendarDataSource{
  _AppointmentDataSource(List<Appointment> source){
    appointments=source;
  }
  
}

