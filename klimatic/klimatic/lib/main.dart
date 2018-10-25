import 'package:flutter/material.dart';
import './ui/klimatic.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Klimatic',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Klimatic(),
    );
  }
}
