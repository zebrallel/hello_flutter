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
        height: 600,
        color: Colors.white,
        child: CustomMultiChildLayout(
          delegate: MyDelegate(),
          children: <Widget>[
            LayoutId(
              id: MyDelegate.item_1,
              child: Text(
                '词汇水平测试',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),
            ),
            LayoutId(
                id: MyDelegate.item_2,
                child: Text('Aa',
                    style: TextStyle(
                        letterSpacing: 10,
                        color: Colors.black,
                        fontSize: 120,
                        fontWeight: FontWeight.w800))),
            LayoutId(
              id: MyDelegate.item_3,
              child: Container(
                width: 50,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(4)),
                child: Center(
                  child: Text('基础'),
                ),
              ),
            ),
            LayoutId(
              id: MyDelegate.item_4,
              child: Container(
                width: 50,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(4)),
                child: Center(
                  child: Text('进阶'),
                ),
              ),
            ),
            LayoutId(
              id: MyDelegate.item_5,
              child: Container(
                width: 50,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(4)),
                child: Center(
                  child: Text('高阶'),
                ),
              ),
            ),
            LayoutId(
              id: MyDelegate.item_6,
              child: Container(
                width: 50,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(4)),
                child: Center(
                  child: Text('专四'),
                ),
              ),
            ),
            LayoutId(
              id: MyDelegate.item_7,
              child: Container(
                width: 50,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(4)),
                child: Center(
                  child: Text('专八'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyDelegate extends MultiChildLayoutDelegate {
  MyDelegate();

  static const int item_1 = 1;
  static const int item_2 = 2;
  static const int item_3 = 3;
  static const int item_4 = 4;
  static const int item_5 = 5;
  static const int item_6 = 6;
  static const int item_7 = 7;

  @override
  void performLayout(Size size) {
    final BoxConstraints constraints = BoxConstraints(maxWidth: size.width);
    layoutChild(item_1, constraints);
    positionChild(item_1, Offset(size.width / 2 - 68, 200));

    layoutChild(item_2, constraints);
    positionChild(item_2, Offset(size.width / 2 - 80, 230));

    layoutChild(item_3, constraints);
    positionChild(item_3, Offset(250, 120));

    layoutChild(item_4, constraints);
    positionChild(item_4, Offset(50, 190));

    layoutChild(item_5, constraints);
    positionChild(item_5, Offset(290, 220));

    layoutChild(item_6, constraints);
    positionChild(item_6, Offset(270, 360));

    layoutChild(item_7, constraints);
    positionChild(item_7, Offset(80, 400));
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}
