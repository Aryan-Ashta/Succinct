
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
      GoRoute(
        path: '/', 
        pageBuilder: (context, state) {
          return NoTransitionPage(
            key: state.pageKey,
            child: CalendarRoute()
          );
        } ,
      ),
      
      GoRoute(
        path: '/planning', 
        pageBuilder: (context, state) {
          return NoTransitionPage(
            key: state.pageKey,
            child: PlanningRoute()
          );
        } ,
      ),
      GoRoute(
        path: '/settings', 
        pageBuilder: (context, state) {
          return NoTransitionPage(
            key: state.pageKey,
            child: SettingsRoute()
          );
        } ,
      ),
      GoRoute(
        path: '/login', 
        pageBuilder: (context, state) {
          return NoTransitionPage(
            key: state.pageKey,
            child: LoginRoute()
          );
        } ,
      ),
      GoRoute(
        path: '/signup', 
        pageBuilder: (context, state) {
          return NoTransitionPage(
            key: state.pageKey,
            child: SignupRoute()
          );
        } ,
      ),
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