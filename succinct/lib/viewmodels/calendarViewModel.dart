import 'package:succinct/services/calendarServices.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';

SfCalendar calendar()  {
  return SfCalendar(
    view: CalendarView.month,
    allowDragAndDrop: true,
    dataSource: _getCalendarDataSource(Events().getEvents()),
    monthViewSettings: MonthViewSettings(
      showAgenda: true,
      dayFormat: 'EEE',

    ),

  );
}

_AppointmentDataSource _getCalendarDataSource(appointments) {
  
  appointments.add(Appointment(
    startTime: DateTime.now(),
    endTime: DateTime.now().add(Duration(minutes: 10)),
    subject: 'Meeting',
    color: const Color.fromARGB(255, 255, 170, 0),
    startTimeZone: '',
    endTimeZone: '',
  ));

  return _AppointmentDataSource(appointments);
}

class _AppointmentDataSource extends CalendarDataSource{
  _AppointmentDataSource(List<Appointment> source){
    appointments=source;
  }
  
}
