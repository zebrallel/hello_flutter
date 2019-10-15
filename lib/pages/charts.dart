import 'package:flutter/widgets.dart';
import 'package:hello_world/components/layout.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:charts_common/src/chart/cartesian/axis/spec/ordinal_axis_spec.dart';

class ChartsPage extends StatelessWidget {
  ChartsPage();

  @override
  Widget build(BuildContext context) {
    return Layout(
        child: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          height: 400,
          child: new charts.BarChart(
            _createSampleData2(),
            barRendererDecorator: new charts.BarLabelDecorator<String>(
                labelPosition: charts.BarLabelPosition.outside,
                outsideLabelStyleSpec: charts.TextStyleSpec(
                    fontSize: 12,
                    color: charts.Color.fromHex(code: '#000000'))),
            domainAxis: charts.OrdinalAxisSpec(
                scaleSpec: SimpleOrdinalScaleSpec(),
                tickProviderSpec: charts.StaticOrdinalTickProviderSpec([
                  charts.TickSpec('2016', label: '20-16'),
                  charts.TickSpec('2014'),
                  charts.TickSpec('2015'),
                  charts.TickSpec('2017'),
                  charts.TickSpec('2018'),
                ]),
                showAxisLine: false,
                renderSpec: charts.GridlineRendererSpec(
                  labelStyle: charts.TextStyleSpec(
                      color: charts.MaterialPalette.green.shadeDefault),
                  lineStyle: charts.LineStyleSpec(
                      color: charts.MaterialPalette.indigo.shadeDefault),
                  labelAnchor: charts.TickLabelAnchor.centered,
                )),
            primaryMeasureAxis: charts.NumericAxisSpec(
                showAxisLine: true,
                renderSpec: charts.GridlineRendererSpec(
                    labelStyle: charts.TextStyleSpec(
                      color: charts.MaterialPalette.pink.shadeDefault,
                    ),
                    lineStyle: charts.LineStyleSpec(
                        color: charts.MaterialPalette.pink.shadeDefault))),
          ),
        ),
        Container(
            padding: EdgeInsets.all(20),
            height: 300,
            child: new charts.BarChart(_createSampleData1(),
                domainAxis: new charts.OrdinalAxisSpec(
                    viewport: new charts.OrdinalViewport('2018', 3)),
                secondaryMeasureAxis: new charts.NumericAxisSpec(
                    tickProviderSpec: charts.BasicNumericTickProviderSpec(
                        desiredTickCount: 6)),
                behaviors: [
                  new charts.SlidingViewport(),
                  new charts.PanAndZoomBehavior(),
                ])),
        Container(
            padding: EdgeInsets.all(20),
            height: 300,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: charts.BarChart(_createSampleData2()),
            ))
      ],
    )));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData1() {
    final data = [
      new OrdinalSales('2014', 55),
      new OrdinalSales('2015', 125),
      new OrdinalSales('2016', 200),
      new OrdinalSales('2017', 100),
      new OrdinalSales('2018', 75),
      new OrdinalSales('2019', 85),
      new OrdinalSales('2020', 95),
      new OrdinalSales('2021', 65),
      new OrdinalSales('2022', 45),
      new OrdinalSales('2023', 25),
      new OrdinalSales('2024', 15),
      new OrdinalSales('2025', 15),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.cyan.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )..setAttribute(charts.measureAxisIdKey, 'secondaryMeasureAxisId')
    ];
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData2() {
    final data = [
      new OrdinalSales('2014', 55),
      new OrdinalSales('2015', 125),
      new OrdinalSales('2016', 200),
      new OrdinalSales('2017', 100),
      new OrdinalSales('2018', 75),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
          id: 'sales2',
          colorFn: (_, __) => charts.MaterialPalette.indigo.shadeDefault,
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: data)
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
