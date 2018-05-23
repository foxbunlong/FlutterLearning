import 'package:flutter/material.dart';

/*
 * Has controlled state in entire application
 */
class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
        color: Colors.deepOrange,
        child: new Center(
            child: new Text(
              "Welcome home",
              textDirection: TextDirection.ltr,
              style: new TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                  fontSize: 34.5),
            )));
  }
}