import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';

class LayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Container(
        margin: EdgeInsets.all(20),
        height: 50,
        width: 50,
        color: Colors.red,
      ),
    );
  }
}