import 'package:flutter/widgets.dart';
import 'package:hello_world/components/button.dart';
import 'package:hello_world/components/layout.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Button(
            text: 'custom button',
            onPress: () {
              print('button clicked!!!');
            },
          )
        ],
      ),
    ));
  }
}
