import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.deepOrange,
      alignment: Alignment.center,

      child: new Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          const Text(
            "AAAAA",
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
            ),
          ),
          const Text(
            "BBBBB",
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
            ),
          ),
          const Text(
            "CCCCC",
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
            ),
          ),
        ],
      ),

//      child: new Row(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          new Text(
//            "Item 1",
//            textDirection: TextDirection.ltr,
//            style: TextStyle(
//              fontSize: 12.9,
//              color: Colors.white,
//            ),
//          ),
//          new Text(
//            "Item 2",
//            textDirection: TextDirection.ltr,
//            style: TextStyle(
//              fontSize: 12.9,
//              color: Colors.white,
//            ),
//          ),
//          const Expanded( // Expanded width view
//            child: const Text(
//              "Item 3",
//              textDirection: TextDirection.ltr,
//              style: TextStyle(
//                fontSize: 12.9,
//                color: Colors.white,
//              ),
//            ),
//          )
//        ],
//      ),

//      child: new Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          new Text(
//            "First item",
//            textDirection: TextDirection.ltr,
//            style: TextStyle(
//              color: Colors.white,
//            ),
//          ),
//          new Text(
//            "Second item",
//            textDirection: TextDirection.ltr,
//            style: TextStyle(
//              color: Colors.blue,
//            ),
//          ),
//          new Container(
//            color: Colors.deepOrange.shade50,
//            alignment: Alignment.bottomLeft,
//            child: new Text(
//              "Third item",
//              textDirection: TextDirection.ltr,
//              style: TextStyle(
//                color: Colors.blue,
//              ),
//            ),
//          )
//        ],
//      ),

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
