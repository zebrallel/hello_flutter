import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';
import 'package:provider/provider.dart';

/// 定义一个Model
class CounterModel with ChangeNotifier {
  int _count = 10;
  int get value => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class ProviderPage extends StatelessWidget {
  final _cm = CounterModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _cm,
      child: MaterialApp(theme: ThemeData.dark(), home: App()),
    );
  }
}

/// Provider<T>.value 可以用来管理恒定的数据
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  Navigator.push(context,
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
              ),
              Hero(
                tag: 'imageHero',
                child: Image.network(
                  'https://picsum.photos/250?image=9',
                ),
              )
            ],
          )),
    );
  }
}

// 使用Provider.of，当数据变化后整个build会重新调用
class CounterA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Counter A build!');
    final cm = Provider.of<CounterModel>(context);

    return Layout(
        child: Center(
            child: Column(
      children: <Widget>[
        Text('Counter A with ${cm._count}'),
        RaisedButton(
          onPressed: () {
            cm.increment();
          },
          child: Text('Add 1'),
        ),
        Hero(
          tag: 'imageHero',
          child: Image.network(
            'https://picsum.photos/250?image=9',
          ),
        )
      ],
    )));
  }
}

/// 使用Consumer我们实现了只刷新局部
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
