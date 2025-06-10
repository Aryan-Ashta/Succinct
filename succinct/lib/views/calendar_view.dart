import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:succinct/services/account_services.dart';
import 'package:succinct/services/calendar_services.dart';
import 'package:succinct/viewmodels/calendar_view_model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarRoute extends StatefulWidget{
  const CalendarRoute({super.key});
  
  @override
  CalendarRouteState createState() => CalendarRouteState();
}

class CalendarRouteState extends State<CalendarRoute>{
  late Future<AppointmentDataSource> _bar;
  Future<List> calendar = getEvents(Events());
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _bar = getCalendarDataSource(calendar);
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      key:_scaffoldKey,
      body: Column(
        children: <Widget>[
          Row(
            children: [
              IconButton(
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                }, 
                icon: Icon(Icons.menu)
              ),
              Text("Calendar", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ],
          ),
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
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.green.shade900,
                    ),
                    child: Text(
                      'Succinct',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.calendar_today),
                    title: Text('Calendar'),
                    onTap: () {
                      context.go('/');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.list),
                    title: Text('Planning'),
                    onTap: () {
                      context.go('/planning');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    onTap: () {
                      context.go('/settings');
                    },
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child:Padding(
                padding: EdgeInsets.all(16.0),
                child:ElevatedButton(
                  onPressed: () {
                    signOut();
                  }, 
                  child: Text("Logout"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
