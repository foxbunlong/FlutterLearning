import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  var data = await readData();

  if (data != null) {
    String message = data;
    print(message);
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
      home: new MyHomePage(title: 'Read Write File'),
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
  var _enterDataField = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
        ),
        body: new Column(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.all(13.4),
              alignment: Alignment.topCenter,
              child: new ListTile(
                title: new TextField(
                  controller: _enterDataField,
                  decoration: InputDecoration(labelText: "Content"),
                ),
              ),
            ),
            new FlatButton(
              onPressed: () {
                // Save to file
                writeData(_enterDataField.text);
              },
              child: new Column(
                children: <Widget>[
                  new Text('Save data'),
                  new Padding(padding: new EdgeInsets.all(14.5)),
                  new FutureBuilder(
                    builder:
                        (BuildContext context, AsyncSnapshot<String> data) {
                      if (data.hasData != null) {
                        return new Text(
                          data.data.toString(),
                          style: new TextStyle(
                            color: Colors.blueAccent
                          ),
                        );
                      } else {
                        return new Text("No data saved");
                      }
                    },
                    future: readData(),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  print(directory);
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;

  return new File('$path/data.txt');
}

// write and read from our file
Future<File> writeData(String message) async {
  final file = await _localFile;

  return file.writeAsString(message);
}

Future<String> readData() async {
  try {
    final file = await _localFile;

    // read file
    String data = await file.readAsString();

    return data;
  } catch (e) {
    return "Nothing saved yet!";
  }
}
