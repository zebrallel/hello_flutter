import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:hello_world/components/layout.dart';
import 'package:charts_common/src/chart/cartesian/axis/spec/ordinal_axis_spec.dart'
    show FixedPixelOrdinalScaleSpec;

final desktopSalesData = [
  new OrdinalSales('2014', 35, Color.fromRGBO(255, 0, 0, 0.5)),
  new OrdinalSales('2015', 25, Colors.red),
  new OrdinalSales('2016', 50, Colors.red),
  new OrdinalSales('today', 75,Colors.red),
];

final tableSalesData = [
  new OrdinalSales('2014', 25, Color.fromRGBO(0, 255, 0, 0.5)),
  new OrdinalSales('2015', 50, Colors.green),
  new OrdinalSales('2016', 10, Colors.green),
  new OrdinalSales('today', 20, Colors.green),
];

final mobileSalesData = [
  new OrdinalSales('2014', 10, Color.fromRGBO(0, 0, 255, 0.5)),
  new OrdinalSales('2015', 15, Colors.blue),
  new OrdinalSales('2016', 50, Colors.blue),
  new OrdinalSales('today', 45, Colors.blue),
];

class StackedBarChart extends StatelessWidget {
  static const secondaryMeasureAxisId = 'secondaryMeasureAxisId';
  final List<charts.Series> seriesList;
  final bool animate;

  StackedBarChart(this.seriesList, {this.animate});

  /// Creates a stacked [BarChart] with sample data and no transition.
  factory StackedBarChart.withSampleData() {
    return new StackedBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
        child: Container(
      padding: EdgeInsets.all(20),
      constraints: BoxConstraints(maxHeight: 500),
      child: Directionality(
          textDirection: TextDirection.ltr,
          child: new charts.BarChart(
            seriesList,
            animate: animate,
            barGroupingType: charts.BarGroupingType.stacked,
            // behaviors: [
            //   new charts.SeriesLegend(
            //       position: charts.BehaviorPosition.end, desiredMaxRows: 3)
            // ],
            defaultRenderer: charts.BarRendererConfig(
                stackHorizontalSeparator: 0,
                strokeWidthPx: 0,
                groupingType: charts.BarGroupingType.stacked,
                barRendererDecorator: new charts.BarLabelDecorator<String>(
                    labelPosition: charts.BarLabelPosition.outside,
                    outsideLabelStyleSpec: charts.TextStyleSpec(
                        fontSize: 12,
                        color: charts.Color.fromHex(code: '#ff3300')))),
            domainAxis: new charts.OrdinalAxisSpec(
                showAxisLine: false,
                scaleSpec: FixedPixelOrdinalScaleSpec(30),
                renderSpec: new charts.SmallTickRendererSpec(
                  // Tick and Label styling here.
                  labelStyle: new charts.TextStyleSpec(
                      fontSize: 14, // size in Pts.
                      color: charts.Color.fromHex(code: '#FF00FF')),
                )),
            secondaryMeasureAxis: new charts.NumericAxisSpec(
                showAxisLine: false,
                tickProviderSpec:
                    charts.StaticNumericTickProviderSpec([
                      charts.TickSpec(0, label: '0'),
                      charts.TickSpec(50, label: '50'),
                      charts.TickSpec(100, label: '100'),
                      charts.TickSpec(150, label: '150'),
                      charts.TickSpec(200, label: '200'),
                    ]),
                renderSpec: new charts.GridlineRendererSpec(
                    labelJustification: charts.TickLabelJustification.outside,
                    labelAnchor: charts.TickLabelAnchor.after,
                    // Tick and Label styling here.
                    labelStyle: new charts.TextStyleSpec(
                        fontSize: 15, // size in Pts.
                        color: charts.Color.fromHex(code: '#FF3300')),
                    // Change the line colors to match text color.
                    lineStyle: new charts.LineStyleSpec(
                        dashPattern: [3],
                        color: charts.Color.fromHex(code: '#0000FF')))),
          )),
    ));
  }

  static String computeYearTotalSales(String year) {
    var list = [desktopSalesData, tableSalesData, mobileSalesData]
        .expand((el) => el)
        .toList();
    var yearMatchedList = list.where((el) => el.year == year).toList();
    var sum = yearMatchedList.fold(0, (value, el) => value + el.sales);

    return sum.toString();
  }

  static String labelFn(OrdinalSales sales, _) {
    return computeYearTotalSales(sales.year);
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        fillColorFn: (OrdinalSales sales, _) => sales.color,
        data: desktopSalesData,
        labelAccessorFn: labelFn,
      )..setAttribute(charts.measureAxisIdKey, secondaryMeasureAxisId),
      new charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        fillColorFn: (OrdinalSales sales, _) => sales.color,
        data: tableSalesData,
        labelAccessorFn: (OrdinalSales sales, _) => '',
      )..setAttribute(charts.measureAxisIdKey, secondaryMeasureAxisId),
      new charts.Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        fillColorFn: (OrdinalSales sales, _) => sales.color,
        data: mobileSalesData,
        labelAccessorFn: (OrdinalSales sales, _) => '',
      )..setAttribute(charts.measureAxisIdKey, secondaryMeasureAxisId),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  String year;
  int sales;
  charts.Color color;

  OrdinalSales(this.year, this.sales, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
