import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void noop() {}

class Button extends StatelessWidget {
  const Button({Key key, @required this.text, this.onPress = noop})
      : super(key: key);

  final Color color = Colors.blue;
  final String text;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: this.color,
      child: Text(this.text),
      onPressed: this.onPress,
    );
  }
}
