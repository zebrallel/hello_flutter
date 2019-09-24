import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';

class CounterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _CounterState();
  }
}

class _CounterState extends State<CounterPage> {
  int _count;

  @override
  void initState() {
    super.initState();

    this._count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
        child: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Count: ${this._count}'),
        RaisedButton(
          child: Text('add count'),
          onPressed: () {
            setState(() {
              this._count++;
            });
          },
        )
      ],
    )));
  }

  @override
  void didUpdateWidget(CounterPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}
