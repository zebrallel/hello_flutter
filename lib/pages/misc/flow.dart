import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';

class FlowPage extends StatelessWidget {
  TextStyle commonStyle =
      TextStyle(color: Colors.black, fontSize: 20, letterSpacing: 5);
  ScrollController _scrollController = ScrollController();
  List<double> heights = [];

  @override
  Widget build(BuildContext context) {
    return Layout(
        child: Center(
            child: ListView(
      controller: _scrollController,
      padding: EdgeInsets.all(10),
      children: <Widget>[
        RaisedButton(
            onPressed: () {
              _scrollController.animateTo(_scrollController.position.maxScrollExtent,
                  duration: Duration(seconds: 1), curve: Curves.ease);
            },
            child: Text('ScrollTo C')),
        Block(
          name: 'A',
          child: Container(
              width: double.infinity,
              color: Colors.cyan[100],
              child: RotatedBox(
                child: Text('aaaaaaaaaaaaaa', style: commonStyle),
                quarterTurns: 3,
              )),
        ),
        Block(
            name: 'B',
            child: Container(
                width: double.infinity,
                color: Colors.cyan[200],
                child: RotatedBox(
                  child: Text('bbbbbbbbbbbbbbb', style: commonStyle),
                  quarterTurns: 3,
                ))),
        Block(
            name: 'C',
            child: Container(
                width: double.infinity,
                color: Colors.cyan[300],
                child: RotatedBox(
                  child: Text('cccccccccccccccc', style: commonStyle),
                  quarterTurns: 3,
                ))),
        Block(
            name: 'D',
            child: Container(
                width: double.infinity,
                color: Colors.cyan[400],
                child: RotatedBox(
                  child: Text('dddddddddddddddd', style: commonStyle),
                  quarterTurns: 3,
                ))),
        Block(
            name: 'E',
            child: Container(
                width: double.infinity,
                color: Colors.cyan[500],
                child: RotatedBox(
                  child: Text('eeeeeeeeeeeeeeee', style: commonStyle),
                  quarterTurns: 3,
                ))),
        Block(
            name: 'F',
            child: Container(
                width: double.infinity,
                color: Colors.cyan[900],
                child: RotatedBox(
                  child: Text('fffffffffffffffff', style: commonStyle),
                  quarterTurns: 3,
                ))),
      ],
    )));
  }
}

class Block extends StatelessWidget {
  Widget child;
  String name;

  Block({this.child, this.name});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onLoad(context);
    });

    return child;
  }

  void onLoad(BuildContext context) {
    print('$name Block onload! - ${context.size.height}');
  }
}
