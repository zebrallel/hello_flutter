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
  String name = 'matt';
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Layout(
      padding: 20,
      child: StoreWidget(
          name,
          age,
          Column(
            children: <Widget>[
              LayoutBuilder(builder: (context, constraints) {
                final StoreWidget store =
                    context.inheritFromWidgetOfExactType(StoreWidget);

                return Text('name: ${store.name}, age: ${store.age}');
              }),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    name = 'matt awesome!';
                  });
                },
                child: Text('change name'),
              ),
              LittleWidget()
            ],
          )),
    );
  }
}

class LittleWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    print('a little text rebuild!');
    return Text('a little text');
  }

}

class StoreWidget extends InheritedWidget {
  String name;
  int age;

  StoreWidget(this.name, this.age, child) : super(child: child);

  @override
  bool updateShouldNotify(StoreWidget oldWidget) {
    print('old widget update, old age: ${oldWidget.age}, old name: ${oldWidget.name}');

    // return name != oldWidget.name || age != oldWidget.age;
    return false;
  }
}
