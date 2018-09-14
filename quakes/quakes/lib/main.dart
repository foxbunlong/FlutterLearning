import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

// Map same as JSON Object has key/value
Map _data;
List features;

void main() async {
  _data = await getQuakes();
  print(_data);
  features = _data['features'];

  if (features != null && features.length > 0) {
    runApp(new MyApp());
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Quakes',
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
        title: new Text('Quakes'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: new Center(
        child: new ListView.builder(
          itemCount: features.length,
          padding: const EdgeInsets.all(15.0),
          itemBuilder: (BuildContext context, int position) {
            if (position.isOdd) {
              return new Divider();
            }

            final index = position ~/ 2;

            var format = new DateFormat.yMMMd("en_US").add_jm();

            var date = format.format(new DateTime.fromMicrosecondsSinceEpoch(
              features[index]['properties']['time'] * 1000,
              isUtc: true,
            ));

            return new ListTile(
              title: new Text(
                "At: $date",
                style: new TextStyle(
                  fontSize: 15.5,
                  color: Colors.orange,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: new Text(
                "${features[index]['properties']['place']}",
                style: new TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
              leading: new CircleAvatar(
                backgroundColor: Colors.green,
                child: new Text(
                  "${features[index]['properties']['mag']}",
                  style: new TextStyle(
                    fontSize: 16.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Future<Map> getQuakes() async {
  String apiUrl =
      'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson';
  http.Response response = await http.get(apiUrl);

  return JSON.decode(response.body);
}
