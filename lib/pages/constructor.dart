import 'package:flutter/widgets.dart';
import 'package:hello_world/components/layout.dart';

class ConstructorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Demo d = Demo('Mike');
    print(d);

    Demo e = Demo('kitty');
    print(e);

    DemoParent f = DemoParent.consTwo('666');
    print(f);
    return Layout(
      child: Center(
        child: Text('check in console'),
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
