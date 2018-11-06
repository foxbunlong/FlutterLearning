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
//                writeData(_enterDataField.text);
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
//                    future: readData(),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
