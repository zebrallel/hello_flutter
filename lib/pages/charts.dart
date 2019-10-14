import 'package:flutter/widgets.dart';
import 'package:hello_world/components/layout.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class ChartsPage extends StatelessWidget {
  ChartsPage();

  @override
  Widget build(BuildContext context) {
    return Layout(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(20),
            height: 300,
            child: new charts.BarChart(_createSampleData1(),
                animate: false,
                barRendererDecorator: new charts.BarLabelDecorator<String>(),
                defaultInteractions: false,
                domainAxis: new charts.OrdinalAxisSpec(
                    viewport: new charts.OrdinalViewport('2014', 6)),
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
          child: new charts.BarChart(_createSampleData2(),
              animate: false, defaultInteractions: false),
        )
      ],
    ));
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
