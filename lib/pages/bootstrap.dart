import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';

class BootstrapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BootstrapPageState();
  }
}

class BootstrapPageState extends State<BootstrapPage>{
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
