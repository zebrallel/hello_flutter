import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hello_world/components/layout.dart';
import 'counter.dart';

final counter = Counter();

class CounterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout(
        padding: 20,
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: double.infinity),
          child: Column(
            children: <Widget>[
              Observer(builder: (_) {
                return Text('count: ${counter.value}');
              }),
              RaisedButton(
                onPressed: () {
                  counter.increment();
                },
                child: Text('increment'),
              )
            ],
          ),
        ));
  }
}
