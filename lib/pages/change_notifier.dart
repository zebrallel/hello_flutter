import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';

class ChangeNotifierDemo extends StatelessWidget {
  final ChangeNotifier store = ChangeNotifier();

  @override
  Widget build(BuildContext context) {
    return Layout(
        child: Column(
      children: <Widget>[
        RaisedButton(onPressed: () {
          var str = DateTime.now().toString();

          print(str);

          store.addListener((){
            print(str);
          });
        }, child: Text('add listener')),
        RaisedButton(onPressed: (){
          store.notifyListeners();
        }, child: Text('trigger'),)
      ],
    ));
  }
}