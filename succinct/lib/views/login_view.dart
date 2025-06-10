
import 'package:flutter/material.dart';
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
        title: Text("Login or Signup"),
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
          ],
        ),
      ),
    );
  }
}