import 'package:flutter/material.dart';
import 'package:hello_world/pages/animation/demo1.dart';
import 'package:hello_world/pages/animation/demo2.dart';
import 'package:hello_world/pages/animation/demo3.dart';

class AnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation',
      home: Scaffold(
        body: _Home(),
      ),
      routes: {
        '/demoA': (context) => DemoA(),
        '/demoB': (context) => DemoB(),
        '/demoC': (context) => DemoC()
      },
    );
  }
}

class _Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text('Demo1'),
            onPressed: () {
              Navigator.of(context).pushNamed('/demoA');
            },
          ),
          RaisedButton(
            child: Text('Demo2'),
            onPressed: () {
              Navigator.of(context).pushNamed('/demoB');
            },
          ),
          RaisedButton(
            child: Text('Demo3'),
            onPressed: () {
              Navigator.of(context).pushNamed('/demoC');
            },
          )
        ],
      ),
    );
  }
}
