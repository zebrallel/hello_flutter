import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';

class _StatefulContainer extends StatefulWidget {
  _StatefulContainer({Key key}) : super(key: key){
    print('stateful container widget rebuild');
  }

  @override
  _StatefulContainerState createState() => _StatefulContainerState();
}

class _StatefulContainerState extends State<_StatefulContainer> {
  String label;

  _StatefulContainerState(){
    var ran = Random();
    label = ran.nextInt(1000).toString();
    print('stateful container state rebuild');
  }

  @override
  Widget build(BuildContext context) {
    print('widget build');
    return Container(
      width: 100,
      height: 100,
      child: Text(label),
    );
  }
}

class _StatelessBox extends StatelessWidget {
  final Color color;

  _StatelessBox(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(height: 100, width: 100, color: color);
  }
}

class _KeyPageState extends State<KeyPage> {
  List<Widget> widgets = [
    // _StatelessBox(Colors.blue),
    // _StatelessBox(Colors.yellow),
    _StatefulContainer(key: UniqueKey()),
    _StatefulContainer(key: UniqueKey()),
  ];

  @override
  Widget build(BuildContext context) {
    return Layout(
        padding: 10,
        child: Column(children: [
          Column(children: widgets),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () {
                widgets.insert(0, widgets.removeAt(1));
                setState(() {});
              },
              child: Text('switch'),
            ),
          )
        ]));
  }
}

class KeyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KeyPageState();
  }
}
