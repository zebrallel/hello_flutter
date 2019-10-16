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
  int _carValue = 100;

  List<charts.Series<Vehicle, String>> createSeries() {
    List<Vehicle> series = [
      Vehicle('car', _carValue, charts.Color.fromHex(code: '#FF0000')),
      Vehicle('bus', 200, charts.Color.fromHex(code: '#FFFF00')),
      Vehicle('bike', 150, charts.Color.fromHex(code: '#0000FF')),
    ];

    return [
      charts.Series<Vehicle, String>(
          id: 'vehicle chart',
          domainFn: (Vehicle vehicle, _) => vehicle.name,
          measureFn: (Vehicle vehicle, _) => vehicle.sales,
          colorFn: (Vehicle vehicle, _) => vehicle.color,
          data: series)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
        child: Column(
      children: <Widget>[
        Container(
            height: 400,
            padding: EdgeInsets.all(20),
            child: charts.BarChart(
              this.createSeries(),
              defaultInteractions: false,
              barRendererDecorator: charts.BarLabelDecorator(
                labelPosition: charts.BarLabelPosition.outside
              ),
              behaviors: [
                charts.SeriesLegend()
              ],
              primaryMeasureAxis: charts.NumericAxisSpec(
                // tickProviderSpec: charts.BasicNumericTickProviderSpec(desiredTickCount: 4)
                tickProviderSpec: charts.StaticNumericTickProviderSpec([
                  charts.TickSpec(0, label: '0'),
                  charts.TickSpec(200, label: '200'),
                ])
              ),
            )),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: RaisedButton(
            child: Text('increase car value'),
            onPressed: () {
              setState(() {
                _carValue = _carValue + 10;
              });
            },
          ),
        )
      ],
    ));
  }
}

class Vehicle {
  String name;
  int sales;
  charts.Color color;

  Vehicle(this.name, this.sales, this.color);
}
