import 'package:flutter/material.dart';

class _StatelessBox extends StatelessWidget {
  final Color color;

  _StatelessBox({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(height: 100, width: 100, color: color);
  }
}

class _KeyPageState extends State<KeyPage>{
  @override
  Widget build(BuildContext context) {
    return Text('aaa');
  }
}

class KeyPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _KeyPageState();
  }

}
