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
    List<Vehicle> series1980 = [
      Vehicle('car', _carValue, charts.Color.fromHex(code: '#FF0000')),
      Vehicle('bus', 200, charts.Color.fromHex(code: '#FFFF00')),
      Vehicle('bike', 150, charts.Color.fromHex(code: '#0000FF')),
      Vehicle('car2', _carValue, charts.Color.fromHex(code: '#FF0000')),
      Vehicle('bus2', 200, charts.Color.fromHex(code: '#FFFF00')),
      Vehicle('bike2', 150, charts.Color.fromHex(code: '#0000FF')),
      Vehicle('car3', _carValue, charts.Color.fromHex(code: '#FF0000')),
      Vehicle('bus3', 200, charts.Color.fromHex(code: '#FFFF00')),
      Vehicle('bike3', 150, charts.Color.fromHex(code: '#0000FF')),
    ];

    List<Vehicle> series1990 = [
      Vehicle('car', 120, charts.Color.fromHex(code: '#FF0000')),
      Vehicle('bus', 190, charts.Color.fromHex(code: '#aabbcc')),
      Vehicle('bike', 110, charts.Color.fromHex(code: '#ccbbaa')),
    ];

    return [
      charts.Series<Vehicle, String>(
          id: '1980s',
          domainFn: (Vehicle vehicle, _) => vehicle.name,
          measureFn: (Vehicle vehicle, _) => vehicle.sales,
          colorFn: (Vehicle vehicle, _) => vehicle.color,
          data: series1980),
      charts.Series<Vehicle, String>(
          id: '1990s',
          domainFn: (Vehicle vehicle, _) => vehicle.name,
          measureFn: (Vehicle vehicle, _) => vehicle.sales,
          colorFn: (Vehicle vehicle, _) => vehicle.color,
          data: series1990)
        ..setAttribute(charts.rendererIdKey, 'customLineSeries'),
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
                  labelPosition: charts.BarLabelPosition.outside),
              behaviors: [charts.SeriesLegend(), charts.SlidingViewport(), charts.PanAndZoomBehavior()],
              domainAxis: charts.OrdinalAxisSpec(
                  viewport: charts.OrdinalViewport('car2', 4)),
              primaryMeasureAxis: charts.NumericAxisSpec(
                  tickProviderSpec:
                      charts.BasicNumericTickProviderSpec(desiredTickCount: 5)
                  //     tickProviderSpec: charts.StaticNumericTickProviderSpec([
                  //   charts.TickSpec(0, label: '0'),
                  //   charts.TickSpec(200, label: '200'),
                  // ])
                  ),
              customSeriesRenderers: [
                charts.LineRendererConfig(customRendererId: 'customLineSeries')
              ],
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
