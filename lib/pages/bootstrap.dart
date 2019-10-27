import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';

class BootstrapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Text('bootstrap'),
      ),
    );
  }
}
