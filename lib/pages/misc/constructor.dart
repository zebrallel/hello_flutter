import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_world/components/layout.dart';

class ConstructorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: List<Widget>.generate(1, (index) {
                return Container(
                  child: Text(
                    '$index. 这是一个比较长长长长\n长长长的文本',
                    // style: TextStyle(fontSize: 20, height: 1),
                    strutStyle: StrutStyle(
                      fontSize: 40,
                      height: 1,
                      
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 0),
                  ),
                );
              }),
            ),
            Column(
              children: List<Widget>.generate(7, (_) {
                return Container(
                  height: 20,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(color: Colors.black, width: 0),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}


class Demo extends DemoParent {
  String name;
  int age;
  static Demo _cache;

  factory Demo(String name) {
    if (_cache == null) {
      _cache = Demo._intetnal(name);
    }

    return _cache;
  }

  Demo._intetnal(this.name) : super.consTwo('');

  @override
  String toString() {
    return '${this.name}-${this.age}';
  }
}

class DemoParent {
  String name;

  DemoParent.consTwo(String name) : this.name = 'cons two: ' + name;

  @override
  String toString() {
    return 'parent ${this.name}';
  }
}
