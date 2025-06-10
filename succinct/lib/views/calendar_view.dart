import 'package:flutter/material.dart';
import 'package:succinct/services/calendar_services.dart';
import 'package:succinct/viewmodels/calendar_view_model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

//rebuiild as a statful widget
class CalendarRoute extends StatefulWidget{
  const CalendarRoute({super.key});
  
  @override
  CalendarRouteState createState() => CalendarRouteState();
}

  class CalendarRouteState extends State<CalendarRoute>{
    late Future<AppointmentDataSource> _bar;
    Future<List> calendar = Events().getEvents();

  @override
  void initState() {
    super.initState();
    _bar = getCalendarDataSource(calendar);
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calendar"),
      ),
      body: Column(
        children: <Widget>[
          FutureBuilder(
            future: _bar, 
            builder: (BuildContext context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Text("Calendar Loading");
              } else{
                return SfCalendar(
                  view: CalendarView.month,
                  allowDragAndDrop: true,
                  dataSource: snapshot.data,
                  monthViewSettings: MonthViewSettings(
                    showAgenda: true,
                    agendaViewHeight: 45,
                    dayFormat: 'EEE',
                    
                  ),
                );
              }
            },
          ),
        ],
      ),
      drawer: Drawer(

      ),
    );
  }
}
