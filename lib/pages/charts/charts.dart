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
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: charts.BarChart(
                _createSampleData3(),
                animate: false,
                defaultInteractions: false, // default true
                barGroupingType: charts.BarGroupingType.grouped,
                behaviors: [new charts.SeriesLegend()],
              ),
            )),
        Container(
            padding: EdgeInsets.all(20),
            height: 400,
            child: new charts.BarChart(_createSampleData1(),
                animate: false,
                domainAxis: new charts.OrdinalAxisSpec(
                    viewport: new charts.OrdinalViewport('2018', 4)),
                secondaryMeasureAxis: new charts.NumericAxisSpec(
                    tickProviderSpec: charts.StaticNumericTickProviderSpec([
                  charts.TickSpec(0, label: '0'),
                  charts.TickSpec(50, label: '50'),
                  charts.TickSpec(100, label: '100'),
                  charts.TickSpec(150, label: '150'),
                  charts.TickSpec(200, label: '200'),
                ])),
                behaviors: [
                  new charts.SlidingViewport(),
                  new charts.PanAndZoomBehavior(),
                ])),
        Container(
          padding: EdgeInsets.all(20),
          height: 400,
          child: new charts.BarChart(
            _createSampleData2(),
            animate: false,
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
      new OrdinalSales('2014', 0),
      new OrdinalSales('2015', 0),
      new OrdinalSales('2016', 0),
      new OrdinalSales('2017', 0),
      new OrdinalSales('2018', 0),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
          id: 'year sales',
          colorFn: (_, __) => charts.MaterialPalette.indigo.shadeDefault,
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: data)
    ];
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData3() {
    final desktopSalesData = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
    ];

    final tabletSalesData = [
      new OrdinalSales('2014', 25),
      new OrdinalSales('2015', 50),
      new OrdinalSales('2016', 10),
      new OrdinalSales('2017', 20),
    ];

    final mobileSalesData = [
      new OrdinalSales('2014', 10),
      new OrdinalSales('2015', 15),
      new OrdinalSales('2016', 50),
      new OrdinalSales('2017', 45),
    ];

    final otherSalesData = [
      new OrdinalSales('2014', 20),
      new OrdinalSales('2015', 35),
      new OrdinalSales('2016', 15),
      new OrdinalSales('2017', 10),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tabletSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Other',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: otherSalesData,
      ),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
