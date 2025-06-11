
import 'package:succinct/services/calendar_services.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
//converts events from the events service to a calendar data source
//see if this can be done with a stream
Future<AppointmentDataSource> getCalendarDataSource() async{
  List<Appointment> appointmentList = <Appointment>[];
  List<Events> eventsList = <Events>[];
  await for (var event in getEvents(Events())){
    eventsList = event;
  }
  for (var event in eventsList){
    appointmentList.add(Appointment(
      subject: event.subject ?? '',
      startTime: DateTime.parse(event.startTime ?? ''), 
      endTime: DateTime.parse(event.endTime ?? ''),
    ));
  }

  return AppointmentDataSource(appointmentList);
}

class AppointmentDataSource extends CalendarDataSource{
  AppointmentDataSource(List<Appointment> source){
    appointments=source;
  }
  
}
