import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';
import 'package:provider/provider.dart';

/// 定义一个Model
class CounterModel with ChangeNotifier {
  int _count = 0;
  int get value => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class ProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<int>.value(
      value: 100,
      child: App(),
    );
  }
}

/// Provider<T>.value 可以用来管理恒定的数据
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(Provider.of<int>(context));

    return Layout(
      padding: 20,
      child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CounterA()));
                },
                child: Text('Counter A'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CounterB()));
                },
                child: Text('Counter B'),
              )
            ],
          )),
    );
  }
}

class CounterA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Counter A build!');
    final count = Provider.of<int>(context);

    return Layout(
        child: Center(
            child: Column(
      children: <Widget>[
        Text('Counter A with $count'),
        RaisedButton(
          onPressed: () {},
          child: Text('Add 1'),
        )
      ],
    )));
  }
}

class CounterB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Counter B build");

    return Consumer<CounterModel>(builder: (context, counter, child) {
      print('Counter B consumer build!');

      return Center(
          child: Layout(
        child: Center(
            child: Column(
          children: <Widget>[
            Text('Counter B with ${counter._count}'),
            RaisedButton(
              onPressed: () {
                counter.increment();
              },
              child: Text('Add 1'),
            )
          ],
        )),
      ));
    });
  }
}
