import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // _ is private method
    void _onSearchPress() {
      print("Search pressed");
    }

    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepOrange,
        title: new Text("Hello Scaffold"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.send),
            onPressed: () => debugPrint("AAAA"),
          ),
          new IconButton(
              icon: new Icon(Icons.search), onPressed: _onSearchPress)
        ],
      ),
      backgroundColor: Colors.orange.shade50,
      body: new Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Long Thay",
              style: TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87),
            ),
            new InkWell(
              child: new Text("Button 1"),
              onTap: () => debugPrint("Button 1 tapped"),
            ), // Like tabhost
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => debugPrint("call ended"),
        backgroundColor: Colors.deepOrangeAccent,
        tooltip: 'Going up!',
        child: new Icon(Icons.call_end),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(Icons.add), title: new Text("Add")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.print), title: new Text("Print")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.call_missed),
              title: new Text("Call missed")),
        ],
        onTap: (int i) => debugPrint("Touch ${i}"),
      ),
    );
  }
}
