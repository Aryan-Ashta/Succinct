
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:succinct/services/account_services.dart';


class PlanningRoute extends StatefulWidget {
  const PlanningRoute({super.key});

  @override
  PlanningRouteState createState() => PlanningRouteState();
}


class PlanningRouteState extends State<PlanningRoute> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                }, 
                icon: Icon(Icons.menu)
              ),
              Text("Planning", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ]
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
