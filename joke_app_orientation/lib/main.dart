import 'package:flutter/material.dart';
import 'package:joke_app_orientation/ui/mater_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MasterDetailScreen(),
    );
  }
}
