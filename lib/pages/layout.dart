import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';

class LayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Container(
        margin: EdgeInsets.all(20),
        width: double.infinity,
        height: 500,
        color: Colors.grey,
        child: CustomMultiChildLayout(
          delegate: TestLayoutDelete(),
          children: <Widget>[
            LayoutId(
              id: TestLayoutDelete.title,
              child: Text(
                'Hello world',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            LayoutId(
              id: TestLayoutDelete.description,
              child: Text(
                'Hello world',
                style: TextStyle(color: Colors.yellow, fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TestLayoutDelete extends MultiChildLayoutDelegate {
  TestLayoutDelete();

  static const String title = 'title';
  static const String description = 'desc';

  @override
  void performLayout(Size size) {
    final BoxConstraints constraints = BoxConstraints(maxWidth: size.width);
    final Size titleSize = layoutChild(title, constraints);

    positionChild(title, Offset(size.width / 2, size.height / 3));

    final double descriptionY = titleSize.height + size.height / 3;
    layoutChild(description, constraints);
    positionChild(description, Offset(20, descriptionY));
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}
