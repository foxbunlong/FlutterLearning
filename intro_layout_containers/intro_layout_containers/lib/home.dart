import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.deepOrange,
      alignment: Alignment.center,

      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            "First item",
            textDirection: TextDirection.ltr,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          new Text(
            "Second item",
            textDirection: TextDirection.ltr,
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          new Container(
            color: Colors.deepOrange.shade50,
            alignment: Alignment.bottomLeft,
            child: new Text(
              "Third item",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),

//      child: new Text(
//        "Hello world",
//        textDirection: TextDirection.ltr,
//        style: new TextStyle(
//          color: Colors.white,
//          fontWeight: FontWeight.w900,
//          fontSize: 18.3,
//        ),
//      ),
    );
  }
}
