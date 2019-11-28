import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Layout extends StatelessWidget {
  Layout({@required this.child, this.padding = 0});

  Widget child;
  double padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Playground'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.maybePop(context)
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(padding),
          child: child,
        ));
  }
}
