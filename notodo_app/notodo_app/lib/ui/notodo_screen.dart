import 'package:flutter/material.dart';
import 'package:notodo_app/model/nodo_item.dart';
import 'package:notodo_app/util/database_client.dart';

class NoToDoScreen extends StatefulWidget {
  @override
  _NoToDoScreenState createState() => _NoToDoScreenState();
}

class _NoToDoScreenState extends State<NoToDoScreen> {

  final TextEditingController _textEditingController = new TextEditingController();
  var db = new DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _readNoDoList();
  }

  void _handleSubmit(String input) async {
    _textEditingController.clear();

    NoDoItem noDoItem = new NoDoItem(input, DateTime.now().toIso8601String());
    int savedItemId = await db.saveNoDoItem(noDoItem);

    print("Item saved id: $savedItemId");

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black87,
      body: Column(),
      floatingActionButton: new FloatingActionButton(
        tooltip: "Add Item",
        backgroundColor: Colors.redAccent,
        child: new ListTile(
          title: Icon(Icons.add),
        ),
        onPressed: _showFormDialog,
      ),
    );
  }

  void _showFormDialog() {
    var alert = new AlertDialog(
      content: new Row(
        children: <Widget>[
          new Expanded(
              child: new TextField(
//            controller: _textEditingController,
            autofocus: true,
            decoration: new InputDecoration(
                labelText: "Item",
                hintText: "eg. Don't buy stuff",
                icon: new Icon(Icons.note_add)),
          ))
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            _handleSubmit(_textEditingController.text);
            _textEditingController.clear();
          },
          child: Text("Save"),
        ),
        new FlatButton(onPressed: () => Navigator.pop(context), child: Text("Cancel"))
      ],
    );
    
    showDialog(context: context, builder: (_) { // _ is context
      return alert;
    });
  }

  _readNoDoList() async {
    List items = await db.getAllNoDoItems();
    items.forEach((item) {
      NoDoItem noDoItem = NoDoItem.map(item);
      print(noDoItem.itemName);
    });
  }
}
