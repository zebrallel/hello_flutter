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
  int _count = 100;

  List<charts.Series<Vehicle, String>> createSeries() {
    final series1980 = [
      Vehicle('car', _count, charts.Color.fromHex(code: '#FF0000')),
      Vehicle('bkie', 200, charts.Color.fromHex(code: '#00FF00')),
      Vehicle('bus', 300, charts.Color.fromHex(code: '#0000FF')),
      Vehicle('car2', _count, charts.Color.fromHex(code: '#FF0000')),
      Vehicle('bkie2', 200, charts.Color.fromHex(code: '#00FF00')),
      Vehicle('bus2', 300, charts.Color.fromHex(code: '#0000FF'))
    ];

    final series1990 = [
      Vehicle('car', 150, charts.Color.fromHex(code: '#FF0000')),
      Vehicle('bkie', 250, charts.Color.fromHex(code: '#00FF00')),
      Vehicle('bus', 120, charts.Color.fromHex(code: '#0000FF'))
    ];

    return [
      charts.Series<Vehicle, String>(
          id: 'vehicle sales',
          domainFn: (Vehicle vehicle, _) => vehicle.name,
          measureFn: (Vehicle vehicle, _) => vehicle.sales,
          colorFn: (Vehicle vehicle, _) => vehicle.color,
          data: series1980),
      charts.Series<Vehicle, String>(
          id: 'vehicle sales',
          domainFn: (Vehicle vehicle, _) => vehicle.name,
          measureFn: (Vehicle vehicle, _) => vehicle.sales,
          colorFn: (Vehicle vehicle, _) => vehicle.color,
          data: series1990)
        ..setAttribute(charts.rendererIdKey, 'line')
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Column(children: <Widget>[
        Container(
            padding: EdgeInsets.all(20),
            height: 400,
            child: charts.BarChart(
              this.createSeries(),
              defaultInteractions: false,
              primaryMeasureAxis: charts.NumericAxisSpec(
                  tickProviderSpec: charts.StaticNumericTickProviderSpec([
                charts.TickSpec(0, label: '0'),
                charts.TickSpec(400, label: '400'),
              ])),
              behaviors: [
                charts.SeriesLegend(),
                charts.SlidingViewport(),
                charts.PanAndZoomBehavior()
              ],
              customSeriesRenderers: [
                charts.LineRendererConfig(customRendererId: 'line')
              ],
              domainAxis: charts.OrdinalAxisSpec(
                  viewport: charts.OrdinalViewport('car2', 4)),
            )),
        RaisedButton(
          child: Text('click me to add car'),
          onPressed: () {
            setState(() {
              _count = _count + 10;
            });
          },
        )
      ]),
    );
  }
}

class Vehicle {
  String name;
  int sales;
  charts.Color color;

  Vehicle(this.name, this.sales, this.color);
}
