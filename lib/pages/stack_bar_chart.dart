import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:hello_world/components/layout.dart';

final desktopSalesData = [
  new OrdinalSales('2014', 35),
  new OrdinalSales('2015', 25),
  new OrdinalSales('2016', 50),
  new OrdinalSales('today', 75),
];

final tableSalesData = [
  new OrdinalSales('2014', 25),
  new OrdinalSales('2015', 50),
  new OrdinalSales('2016', 10),
  new OrdinalSales('today', 20),
];

final mobileSalesData = [
  new OrdinalSales('2014', 10),
  new OrdinalSales('2015', 15),
  new OrdinalSales('2016', 50),
  new OrdinalSales('today', 45),
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
            barRendererDecorator: new charts.BarLabelDecorator<String>(
                labelPosition: charts.BarLabelPosition.outside,
                outsideLabelStyleSpec: charts.TextStyleSpec(
                    fontSize: 18,
                    color: charts.Color.fromHex(code: '#ff3300'))),
            domainAxis: new charts.OrdinalAxisSpec(
                showAxisLine: false,
                renderSpec: new charts.SmallTickRendererSpec(
                  // Tick and Label styling here.
                  labelStyle: new charts.TextStyleSpec(
                      fontSize: 18, // size in Pts.
                      color: charts.Color.fromHex(code: '#FF3300')),
                )),
            secondaryMeasureAxis: new charts.NumericAxisSpec(
                showAxisLine: false,
                tickProviderSpec:
                    charts.BasicNumericTickProviderSpec(desiredTickCount: 5),
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
        seriesColor: charts.Color.black,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
        labelAccessorFn: labelFn,
      )..setAttribute(charts.measureAxisIdKey, secondaryMeasureAxisId),
      new charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        seriesColor: charts.Color.fromHex(code: '#ff3300'),
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesData,
        labelAccessorFn: (OrdinalSales sales, _) => '',
      )..setAttribute(charts.measureAxisIdKey, secondaryMeasureAxisId),
      new charts.Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
        labelAccessorFn: (OrdinalSales sales, _) => '',
      )..setAttribute(charts.measureAxisIdKey, secondaryMeasureAxisId),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}

/**
 * 待解决的问题：
 * 1. line width
 */
