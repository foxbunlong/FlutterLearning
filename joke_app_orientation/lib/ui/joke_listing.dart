import 'package:flutter/material.dart';
import 'package:joke_app_orientation/model/joke.dart';

class JokeListing extends StatelessWidget {
  JokeListing({@required this.jokeSelectedCallback, this.jokeSelected});

  final ValueChanged<Joke> jokeSelectedCallback;
  final Joke jokeSelected;

  @override
  Widget build(BuildContext context) {
    return ListView(
      // ignore: static_access_to_instance_member
      children: Joke.jokesList.map((joke) {
        return Container(
          child: ListTile(
            title: Text(joke.setup),
            onTap: () => jokeSelectedCallback(joke),
            selected: jokeSelected == joke,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(4.5),
          ),
        );
      }).toList(),
    );
  }
}
