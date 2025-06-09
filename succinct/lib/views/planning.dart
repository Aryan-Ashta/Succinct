
import 'package:flutter/material.dart';

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
          'Planning',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

      ),
      drawer: Drawer(
       
      ),
    );
  }
}
