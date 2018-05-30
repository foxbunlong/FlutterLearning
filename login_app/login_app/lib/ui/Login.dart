import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }

}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
        backgroundColor: Colors.orangeAccent,
      ),
      backgroundColor: Colors.orangeAccent.shade100,
    );
  }

}