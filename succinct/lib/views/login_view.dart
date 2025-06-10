
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:succinct/services/login_services.dart';


class LoginRoute extends StatefulWidget {
  const LoginRoute({super.key});
  
  @override
  LoginRouteState createState() {
  return LoginRouteState();
  }
}

class LoginRouteState extends State <LoginRoute> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children:<Widget>[
            Padding(
              padding: EdgeInsets.only(left:15.0, right: 15.0, top: 15.0, bottom: 15.0),
              child:TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: "example@gmail.com"
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:15.0, right: 15.0, top: 15.0, bottom: 15.0),
              child:TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
                onSaved: (value){
                  _password = value!;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  hintText: "Enter a secure password",
                ),
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 65,
              width: 360,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade900,
                    foregroundColor: Colors.green,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      signInWithEmail(_email, _password,context);
                    }
                  },
                  child: Text(
                    'Log in ',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 90,
              width: 360,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade900,
                    foregroundColor: Colors.green,
                  ),
                  onPressed: () {
                    context.go('/signup');
                  },
                  child: Text(
                    "Don't have an account? Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
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
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Account'),
              onTap: () {
                context.go('/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}