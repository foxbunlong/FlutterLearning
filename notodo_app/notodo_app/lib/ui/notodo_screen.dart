import 'package:flutter/material.dart';
import 'package:notodo_app/model/nodo_item.dart';
import 'package:notodo_app/util/database_client.dart';
import 'package:notodo_app/util/date_formatter.dart';

class NoToDoScreen extends StatefulWidget {
  @override
  _NoToDoScreenState createState() => _NoToDoScreenState();
}

class _NoToDoScreenState extends State<NoToDoScreen> {
  final TextEditingController _textEditingController =
      new TextEditingController();
  var db = new DatabaseHelper();
  final List<NoDoItem> _itemList = <NoDoItem>[];

  @override
  void initState() {
    // Call every time we draw activity on screen
    super.initState();
    _readNoDoList();
  }

  void _handleSubmit(String input) async {
    _textEditingController.clear();

    print("$input");
    NoDoItem noDoItem = new NoDoItem(input, dateFormatted());
    int savedItemId = await db.saveNoDoItem(noDoItem);

    NoDoItem addedItem = await db.getNoDoItem(savedItemId);

    setState(() {
      _itemList.insert(0, addedItem);
    });

    print("Item saved id: $savedItemId");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: false,
              itemCount: _itemList.length,
              itemBuilder: (_, int index) {
                return new Card(
                  color: Colors.white10,
                  child: new ListTile(
                    title: _itemList[index],
                    onLongPress: () => _updateItem(_itemList[index], index),
                    trailing: new Listener(
                      key: new Key(_itemList[index].itemName),
                      child: new Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                      ),
                      onPointerDown: (pointerEvent) =>
                          _deleteNoDo(_itemList[index].id, index),
                    ),
                  ),
                );
              },
            ),
          ),
          new Divider(
            height: 1.0,
          ),
        ],
      ),
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
            controller: _textEditingController,
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
            Navigator.pop(context);
          },
          child: Text("Save"),
        ),
        new FlatButton(
            onPressed: () => Navigator.pop(context), child: Text("Cancel"))
      ],
    );

    showDialog(
        context: context,
        builder: (_) {
          // _ is context
          return alert;
        });
  }

  _readNoDoList() async {
    List items = await db.getAllNoDoItems();
    items.forEach((item) {
      NoDoItem noDoItem = NoDoItem.map(item);

      setState(() {
        _itemList.add(NoDoItem.map(item));
      });
    });
  }

  _deleteNoDo(int id, int index) async {
    await db.deleteNoDoItem(id);

    setState(() {
      _itemList.removeAt(index);
    });
  }

  _updateItem(NoDoItem noDoItem, int index) {
    var alert = new AlertDialog(
      title: new Text("Update item"),
      content: new Row(
        children: <Widget>[
          new Expanded(
            child: new TextField(
              controller: _textEditingController,
              autofocus: true,
              decoration: new InputDecoration(
                labelText: "Item",
                hintText: "eg. Don't buy stuff",
                icon: new Icon(Icons.update),
              ),
            ),
          )
        ],
      ),
      actions: <Widget>[
        new FlatButton(onPressed: () async {
          NoDoItem newItemUpdated = NoDoItem.fromMap({
            "itemName": _textEditingController.text,
            "dateCreated": dateFormatted(),
            "id": noDoItem.id
          });
          
          _handleUpdate(index, newItemUpdated);
          await db.updateNoDoItem(newItemUpdated);

          setState(() {
            _readNoDoList();
          });

          Navigator.pop(context);

        }, child: Text("Update")),
        new FlatButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
      ],
    );
    showDialog(context: context, builder: (_) {
      return alert;
    });
  }

  void _handleUpdate(int index, NoDoItem newItemUpdated) {
    setState(() {
      _itemList.removeWhere((element) {
        _itemList[index].itemName == newItemUpdated.itemName;
      });
    });
  }
}
