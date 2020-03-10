import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';

class InheritWidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrapper();
  }
}

class Wrapper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WrapperState();
  }
}

class WrapperState extends State<Wrapper> {
  Widget block = StoreWidget('matt', 18, LittleWidget());

  @override
  Widget build(BuildContext context) {
    return Layout(
      padding: 20,
      child: Column(
        children: <Widget>[
          block,
          RaisedButton(
            onPressed: () {
              setState(() {
                block = StoreWidget('matt awesome', 26, LittleWidget());
              });
            },
            child: Text('change name'),
          )
        ],
      ),
    );
  }
}

class LittleWidget extends StatefulWidget {
  const LittleWidget();

  @override
  State<StatefulWidget> createState() {
    return LittleWidgetState();
  }
}

class LittleWidgetState extends State<LittleWidget> {
  @override
  void didUpdateWidget(LittleWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    print('did update widget');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    print('little widget did change dependencies');
  }

  @override
  Widget build(BuildContext context) {
    print('little widget rebuild');

    final store = StoreWidget.of(context);

    return Column(
      children: <Widget>[
        Text('name: ${store.name}, age: ${store.age}'),
      ],
    );
  }
}

class StoreWidget extends InheritedWidget {
  String name;
  int age;

  StoreWidget(this.name, this.age, child) : super(child: child);

  static StoreWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(StoreWidget);
  }

  @override
  bool updateShouldNotify(StoreWidget oldWidget) {
    print(
        'old widget update, old age: ${oldWidget.age}, old name: ${oldWidget.name}');

    return name != oldWidget.name || age != oldWidget.age;
  }
}
