import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  bool bordered;
  Widget child;
  double width;
  double height;

  Box({this.bordered = false, this.child, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: bordered
          ? BoxDecoration(
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(3))
          : null,
      child: child,
    );
  }
}
