import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int radioValue = 0;

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;

      print(radioValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade800,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/planet.png',
              width: 133.0,
              height: 200.0,
            ),

            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: null,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Your weight on Earth',
                        hintText: 'In pounds',
                        icon: new Icon(Icons.person_outline)),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.0)),
                  // 3 radio buttons
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                          value: 0,
                          activeColor: Colors.brown,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        "Pluto",
                        style: new TextStyle(color: Colors.white),
                      ),
                      new Radio<int>(
                          value: 1,
                          activeColor: Colors.red,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        "Mars",
                        style: new TextStyle(color: Colors.white),
                      ),
                      new Radio<int>(
                          value: 2,
                          activeColor: Colors.orangeAccent,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        "Venus",
                        style: new TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            )
            // form
          ],
        ),
      ),
    );
  }
}
