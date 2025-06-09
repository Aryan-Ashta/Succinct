import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:go_router/go_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const CalendarRoute(),
      '/second': (context) => const PlanningRoute(),
      '/third': (context) => const SettingsRoute(),
    },
  ));
}


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
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text('Succinct', style: TextStyle(fontSize: 30)),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Calendar'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.route),
              title: const Text('Planning'),
              onTap: () {
                Navigator.pushNamed(context, '/second');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/third');
              },
            ),
          ],
        ),
      ),
    );
  }
}


class PlanningRoute extends StatelessWidget {
  const PlanningRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planning'),
      ),
      body: const Center(
        child: Text(
          'Planning Route',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text('Succinct', style: TextStyle(fontSize: 30)),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Calendar'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.route),
              title: const Text('Planning'),
              onTap: () {
                Navigator.pushNamed(context, '/second');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/third');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsRoute extends StatelessWidget {
  const SettingsRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Center(
        child: Text(
          'Settings Route',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text('Succinct', style: TextStyle(fontSize: 30)),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Calendar'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.route),
              title: const Text('Planning'),
              onTap: () {
                Navigator.pushNamed(context, '/second');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/third');
              },
            ),
          ],
        ),
      ),
    );
  }
}