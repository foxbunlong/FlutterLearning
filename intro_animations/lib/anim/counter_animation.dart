import 'package:flutter/material.dart';

// stanim - shortcut
class CounterAnimation extends StatefulWidget {
  @override
  _CounterAnimationState createState() => _CounterAnimationState();
}

class _CounterAnimationState extends State<CounterAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;
  int _counter = 0;

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    animation = new Tween(begin: 0.0, end: 10.0).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse(from: 5.0);
        } else if (status == AnimationStatus.reverse) {
          this.setState(() {
            this._counter = this._counter - 400;
          });
        }
      })
      ..addListener(() {
        debugPrint("Animation tween ${animation.value}");
      });
//    animation = new CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.addListener(() {
      this.setState(() {
        _counter++;
        debugPrint("$_counter");
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: Text(
        _controller.isAnimating ? (_counter.toStringAsFixed(2)) : "Let's begin",
        style: TextStyle(fontSize: animation.value + 16.0),
//        style: TextStyle(fontSize: 24.0 * _controller.value + 16.0),
      ),
      onTap: () {
        _controller.forward(from: 0.0);
      },
    );
  }
}
