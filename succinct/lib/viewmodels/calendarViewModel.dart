import 'package:syncfusion_flutter_calendar/calendar.dart';

SfCalendar calendar()  {
  return SfCalendar(
    view: CalendarView.month,
    monthViewSettings: MonthViewSettings(
      showAgenda: true,
      dayFormat: 'EEE',
      
    ),

  );
}