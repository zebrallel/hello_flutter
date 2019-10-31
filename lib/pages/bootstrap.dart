import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';

class BootstrapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BootstrapPageState();
  }
}

class BootstrapPageState extends State<BootstrapPage> {
  int count;

  @override
  void initState() {
    super.initState();

    count = 10;
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('add count'),
                onPressed: () {
                  setState(() {
                    count++;
                  });
                },
              ),
              if( count % 2 == 0) _SubClass(count),
              // _SubClass(count),
              Text('Flutter',
                  style: TextStyle(fontSize: 26, color: Color(0xff25222d)))
            ],
          )),
    );
  }
}

class _SubClass extends StatefulWidget {
  final int count;

  _SubClass(this.count);

  @override
  State<StatefulWidget> createState() {
    return _SubClassState();
  }
}

class _SubClassState extends State<_SubClass> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    print('did change dependencies');
  }

  @override
  void didUpdateWidget(_SubClass oldWidget) {
    super.didUpdateWidget(oldWidget);

    print('did update widget, ${oldWidget.count}, ${widget.count}');
  }

  @override
  void deactivate() {
    super.deactivate();

    print('deactive');
  }

  @override
  void dispose() {
    super.dispose();

    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    return Text('sub class count: ${widget.count}');
  }
}
