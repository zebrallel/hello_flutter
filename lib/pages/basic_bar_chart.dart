import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_world/components/layout.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BasicBarChartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BasicBarChartState();
  }
}

class BasicBarChartState extends State<BasicBarChartPage> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Column(
        children: <Widget>[Text('basic chart')],
      ),
    );
  }
}
