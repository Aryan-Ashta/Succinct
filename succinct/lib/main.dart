import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:succinct/views/calendar.dart';
import 'package:succinct/views/planning.dart';
import 'package:succinct/views/settings.dart';
import 'firebase_options.dart';
import 'package:go_router/go_router.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(path: '/', builder:(context, state) => CalendarRoute(),),
      GoRoute(path: '/planning', builder:(context, state) => PlanningRoute(),),
      GoRoute(path: '/settings', builder:(context, state) => SettingsRoute(),)
    ]
  );
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Succint'
    );
    
  }
}