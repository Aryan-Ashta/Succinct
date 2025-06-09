import 'package:flutter/material.dart';


class LoginRoute extends StatelessWidget {
  const LoginRoute({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Stack(),
      drawer: Drawer(
              ),
    );
  }
}