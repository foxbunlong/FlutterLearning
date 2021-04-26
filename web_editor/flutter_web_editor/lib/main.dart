import 'dart:convert';
import 'dart:io' as Io;
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_summernote/flutter_summernote.dart';
import 'package:path_provider/path_provider.dart';
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FlutterSummernoteState> _keyEditor = GlobalKey();
  String result = "";
  List<String> list = List();

  _write(String base64) async {
    // final Directory directory = await getApplicationDocumentsDirectory();
    // final File file = File('${directory.path}/my_file.txt');
    // await file.writeAsString(text);

    final decodedBytes = base64Decode(base64.replaceAll("data:image/png;base64, ", ""));

    final Directory directory = await getApplicationDocumentsDirectory();
    var file = Io.File('${directory.path}/test.png');
    if (file.existsSync()) {
      file.create();
    }

    file.writeAsBytesSync(decodedBytes);

  }

  Uint8List base64Decode(String source) => base64.decode(source);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlutterSummernote(
            key: _keyEditor,
            hasAttachment: true,
            returnContent: (rawHtmlScript) {
              // Write image to file
              var refineImageHtml = rawHtmlScript.substring(rawHtmlScript.indexOf("src=") + 5, rawHtmlScript.lastIndexOf(" data-filename") - 1);
              _write(refineImageHtml);

              debugPrint("raw html: ${rawHtmlScript}");

              dom.Document document = parser.parse(rawHtmlScript);
              final elements = document.querySelectorAll("img");
              debugPrint("Total elements: ${elements.length}");

              setState(() {
                result = rawHtmlScript;

                list = elements
                    .map((element) =>
                element.attributes['src'])
                    .toList();

                debugPrint("Total images: ${list.length}");
                for (int i = 0; i < list.length; i++) {
                  debugPrint("image: ${list[i]}");
                }
              });
            },
            height: 300,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  color: Colors.blueGrey,
                  onPressed: () {
                    setState(() {
                      _keyEditor.currentState.setEmpty();
                    });
                  },
                  child:
                  Text("Reset", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  width: 16,
                ),
                FlatButton(
                  color: Colors.blue,
                  onPressed: () async {
                    await _keyEditor.currentState.getText();
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
