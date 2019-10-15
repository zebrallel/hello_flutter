import 'package:flutter/material.dart';
import 'package:hello_world/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('Playground')),
      body: RoutePage(),
    ));
  }
}
