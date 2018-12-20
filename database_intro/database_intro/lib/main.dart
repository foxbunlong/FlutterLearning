import 'package:database_intro/models/User.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:database_intro/utils/database_helper.dart';

List _users;

void main() async {
  var db = new DatabaseHelper();

//  int savedUser = await db.saveUser(new User("Ana", "password"));
//  print("User saved $savedUser");

  User ana = await db.getUser(1);
  print("Ana : ${ana.username}");

  User anaUpdated = User.fromMap({
    "username": "Update Ana" ,
    "password": "Update passord",
    "id": ana.id
  });
  await db.updateUser(anaUpdated);

//  int userDeleted = await db.deleteUser(2); // = 0 if not found
//  print("userDeleted: $userDeleted");

  int count = await db.getCount();
  print("Count: $count");

  _users = await db.getAllUsers();
  for (int i = 0; i < _users.length; i++) {
    User user = User.map(_users[i]);
    print("User name : ${user.username} - ID: ${user.id}");
  }

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Database Intro'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
