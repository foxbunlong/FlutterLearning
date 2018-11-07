import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  String _savedData = "";

  @override
  void initState() {
    super.initState();

    _loadSavedData();
  }

  _loadSavedData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      if (preferences.getString("data") != null && preferences.getString("data").isNotEmpty) {
        _savedData = preferences.getString("data");
      } else {
        _savedData = "Empty!";
      }
    });
  }

  _saveData(String data) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('data', data);
  }

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
                _saveData(_enterDataField.text);
              },
              child: new Column(
                children: <Widget>[
                  new Text('Save data'),
                  new Padding(padding: new EdgeInsets.all(14.5)),
                  new Text(_savedData),
                ],
              ),
            ),
          ],
        ));
  }
}
