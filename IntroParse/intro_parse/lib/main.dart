import 'package:flutter/material.dart';
import 'dart:async' as async;
import 'dart:convert' as conv;
import 'package:http/http.dart' as http;

String _body = "";
List _data;

void main() async {
  _data = await getJson();

  for (int i = 0; i < _data.length; i++) {
    print(_data[i]['title']);
//    print(_data[i]['name']);
//    print(_data[i]['address']['street']);
  }

  _body = _data[0]['body'];

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'JSON Parser',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'JSON Parser'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new ListView.builder(
            itemCount: _data.length,
            padding: const EdgeInsets.all(14.5),
            itemBuilder: (BuildContext context, int position) {
              return Column(
                children: <Widget>[
                  new Divider(height: 5.5),
                  new ListTile(
                    title: Text(
                      "${_data[position]['title']}",
                      style: new TextStyle(
                        fontSize: 17.9,
                      ),
                    ),
                    subtitle: Text(
                      "${_data[position]['body']}",
                      style: new TextStyle(
                        fontSize: 13.9,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    leading: new CircleAvatar(
                      backgroundColor: Colors.greenAccent,
                      child: Text(
                        "${_data[position]['body'][0]}".toUpperCase(),
                        style: TextStyle(
                          fontSize: 16.4,
                          fontWeight: FontWeight.w800,
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ),
                    onTap: () => _onTapMessage(context, _data[position]['body']),
                  )
                ],
              );
            }),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

void _onTapMessage(BuildContext context, String message) {
  var alert = new AlertDialog(
    title: Text("My App"),
    content: Text(message),
    actions: <Widget>[
      FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.pop(context); // Show from stack
        },
      )
    ],
  );

  // showDialog(context: context, child: alert);
  showDialog(context: context, builder: (context) => alert);
}

async.Future<List> getJson() async {
  String apiUrl = 'http://jsonplaceholder.typicode.com/posts';
//  String apiUrl = 'http://jsonplaceholder.typicode.com/users';

  http.Response response = await http.get(apiUrl);

  if (response.statusCode == 200) {
    return conv.JSON.decode(response.body);
  }
}
