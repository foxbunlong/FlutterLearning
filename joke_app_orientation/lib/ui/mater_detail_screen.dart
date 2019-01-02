import 'package:flutter/material.dart';
import 'package:joke_app_orientation/model/joke.dart';
import 'package:joke_app_orientation/ui/joke_details.dart';
import 'package:joke_app_orientation/ui/joke_listing.dart';

class MasterDetailScreen extends StatefulWidget {
  @override
  _MasterDetailScreenState createState() => _MasterDetailScreenState();
}

class _MasterDetailScreenState extends State<MasterDetailScreen> {
  static const int tabletBreakpoint = 600; // size > 600 will be tablet
  Joke _selectedJoke;

  Widget _buildMobileLayout() {
    return JokeListing(
      jokeSelectedCallback: (Joke jokeSelected) {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return JokeDetails(
            joke: jokeSelected,
            isInTabletLayout: false,
          );
        }));
      },
    );
  }

  Widget _buildTabletLayout() {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Material(
            elevation: 13.0,
            child: JokeListing(
              jokeSelectedCallback: (joke) {
                setState(() {
                  _selectedJoke = joke;
                });
              },
              jokeSelected: _selectedJoke,
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: JokeDetails(isInTabletLayout: true, joke: _selectedJoke),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.portrait &&
        shortestSide < tabletBreakpoint) {
      // Mobile
      content = _buildMobileLayout();
    } else {
      // Tablet
      content = _buildTabletLayout();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Jokes"),
      ),
      body: content,
    );
  }
}
