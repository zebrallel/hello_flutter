import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _CounterState();
  }
}

class _CounterState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Text('this is counter page');
  }
}
