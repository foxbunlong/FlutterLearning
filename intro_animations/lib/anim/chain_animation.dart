import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class ChainAnimation extends AnimatedWidget {
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1.0);
  static final _sizeTween = Tween<double>(begin: 0.0, end: 175);

  ChainAnimation({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: FlatButton(
              onPressed: () {
                print("Hello there");
              },
              color: Colors.blue,
              child: Text("Button")),
        ),
      ),
    );
  }
}
