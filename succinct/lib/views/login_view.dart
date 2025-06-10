
import 'package:flutter/material.dart';
import 'package:succinct/services/login_services.dart';


class LoginRoute extends StatefulWidget {
  const LoginRoute({super.key});
  
  @override
  LoginRouteState createState() => LoginRouteState();

}

class LoginRouteState extends State <LoginRoute> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Login or Signup"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left:15.0, right: 15.0, top: 15.0, bottom: 15.0),
            child:TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: "example@gmail.com"
                ),
              ),
          ),
          Padding(
            padding: EdgeInsets.only(left:15.0, right: 15.0, top: 15.0, bottom: 15.0),
            child:TextField(
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
                hintText: "Enter a secure password",
              ),
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
                  signInWithEmail(emailController.text, passwordController.text);
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
    );
  }
}