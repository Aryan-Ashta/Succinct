import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:succinct/services/account_services.dart';
import 'package:succinct/views/calendar_view.dart';
import 'package:succinct/views/planning_view.dart';
import 'package:succinct/views/settings_view.dart';
import 'package:succinct/views/account_views.dart';
import 'firebase_options.dart';
import 'package:go_router/go_router.dart';


Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  MyApp({super.key});
  
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(path: '/', builder:(context, state) => CalendarRoute(),),
      GoRoute(path: '/planning', builder:(context, state) => PlanningRoute(),),
      GoRoute(path: '/settings', builder:(context, state) => SettingsRoute(),),
      GoRoute(path: '/login', builder: (context, state) => LoginRoute(),),
      GoRoute(path: '/signup', builder: (context, state) => SignupRoute(),)
    ]
  );
  
  @override
  Widget build(BuildContext context) {
    if (isLoggedIn == null){
      _router.go('/login');
    } else {
      _router.go('/');
    }
    
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Succint'
    );
    
  }
}