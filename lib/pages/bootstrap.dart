import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';

class BootstrapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Container(
        alignment: Alignment.center,
        child: Text('Hello Flutter',
            style: TextStyle(fontSize: 26, color: Color(0xff25222d))),
      ),
    );
  }
}
