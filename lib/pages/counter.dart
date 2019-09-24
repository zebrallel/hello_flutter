import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';

class CounterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _CounterState();
  }
}

class _CounterState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Text('this is counter page'),
    );
  }
}
