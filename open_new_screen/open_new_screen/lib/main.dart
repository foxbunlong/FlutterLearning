import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
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
  var _nameFieldController = new TextEditingController();

  // Expect to receive data in the future
  Future _gotoNextScreen(BuildContext context) async {
    Map results = await Navigator
        .of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) {
      return new SecondPage(name: _nameFieldController.text);
    }));

    if (results != null && results.containsKey('info')) {
      print(results['info'].toString());
      _nameFieldController.text = results['info'].toString();
    } else {
      print("Nothing");
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('First Screen'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: new TextField(
              controller: _nameFieldController,
              decoration: new InputDecoration(labelText: 'Enter your name'),
            ),
          ),
          new ListTile(
            title: new RaisedButton(
              child: new Text("Send to next screen"),
              onPressed: () {
                _gotoNextScreen(context);
              },
            ),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SecondPage extends StatefulWidget {
  final String name;

  // Key and Name are optional
  SecondPage({Key key, this.name}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  var _backTextFieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.greenAccent,
        title: new Text("Second screen"),
        centerTitle: true,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new ListTile(
              title: new Text('${widget.name}'),
            ),
            new ListTile(
              title: new TextField(
                controller: _backTextFieldController,
              ),
            ),
            new ListTile(
              title: new FlatButton(
                  onPressed: () {
                    Navigator
                        .pop(context, {'info': _backTextFieldController.text});
                  },
                  child: new Text('Send back')),
            )
          ],
        ),
      ),
//      body: new ListTile(
//        title: new Text('${widget.name}'),
//      ),
    );
  }
}
