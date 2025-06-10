
import 'package:syncfusion_flutter_calendar/calendar.dart';
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

  return Future<AppointmentDataSource>(appointments);
}

class AppointmentDataSource extends CalendarDataSource{
  AppointmentDataSource(List<Appointment> source){
    appointments=source;
  }
  
}

