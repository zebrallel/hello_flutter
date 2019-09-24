import 'package:flutter/widgets.dart';
import 'package:hello_world/components/button.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
