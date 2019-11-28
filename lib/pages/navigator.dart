import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';

class NavigatorDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Navigator Demo', routes: {
      '/': (context) {
        return Scaffold(
          body: _Home(),
        );
      },
      '/pageA': (context) {
        return Layout(
            padding: 20,
            child: Center(
              child: Column(
                children: <Widget>[
                  Text('Page A'),
                  RaisedButton(
                    child: Text('pushReplacementNamed to page B'),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/pageB');
                    },
                  )
                ],
              ),
            ));
      },
      '/pageB': (context) {
        return Layout(
          padding: 20,
          child: Text('Page B'),
        );
      },
      '/pageC': (context) {
        return Layout(
            padding: 20,
            child: Center(
              child: Column(
                children: <Widget>[
                  Text('Page C'),
                  RaisedButton(
                    child: Text('Go to PageC'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/pageC');
                    },
                  ),
                  RaisedButton(
                    child: Text('pushNamedAndRemoveUntil to home page'),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/', ModalRoute.withName('/'));
                    },
                  )
                ],
              ),
            ));
      },
    });
  }
}

class _Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout(
        padding: 20,
        child: Center(
            child: Column(
          children: <Widget>[
            Text('Home'),
            RaisedButton(
              child: Text('Go to PageA'),
              onPressed: () {
                Navigator.pushNamed(context, '/pageA');
              },
            ),
            RaisedButton(
              child: Text('Go to PageC'),
              onPressed: () {
                Navigator.pushNamed(context, '/pageC');
              },
            ),
            RaisedButton(
              child: Text('Pop'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            RaisedButton(
              child: Text('Maybe Pop'),
              onPressed: () {
                Navigator.maybePop(context);
              },
            ),
            RaisedButton(
              child: Text('Can Pop'),
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                } else {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('We can not pop anymore')));
                }
              },
            ),
          ],
        )));
  }
}
