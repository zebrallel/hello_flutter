import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';

class DemoA extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DemoAState();
  }
}

class DemoAState extends State<DemoA> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      })
      ..addStatusListener((state) => print('$state'));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
        padding: 20,
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Height: ${animation.value}'),
              Container(
                  width: 200, height: animation.value, color: Colors.cyan[900]),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
