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
              if (count % 2 == 0)
                _SubClass(count),
              // _SubClass(count),
              Text('abc',
                  style: TextStyle(fontSize: 12, color: Color(0xff25222d))),
              ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: 50, maxWidth: 100, minHeight: 50, maxHeight: 200),
                child: Container(
                  color: Color(0xffff3300),
                ),
              )
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

class _SubClassState extends State<_SubClass> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this); // 注册监听器
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    print('did change dependencies');
  }

  @override
  void didUpdateWidget(_SubClass oldWidget) {
    super.didUpdateWidget(oldWidget);

    print(
        'did update widget, ${oldWidget.count}, ${widget.count}, ${oldWidget == widget}');
  }

  @override
  void deactivate() {
    super.deactivate();

    print('deactive');
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // 移除监听器
    print('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text('sub class count: ${widget.count}');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("app state: $state");
  }
}
