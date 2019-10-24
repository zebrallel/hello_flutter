import 'package:flutter/widgets.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_common/src/chart/cartesian/axis/spec/ordinal_axis_spec.dart'
    show FixedPixelOrdinalScaleSpec;

class EmptyMasteryBlock extends StatelessWidget {
  static List<charts.Series<EmptyModel, String>> _createSeries() {
    DateTime today = DateTime.now();

    final series = [
      EmptyModel(today.subtract(Duration(days: 6))),
      EmptyModel(today.subtract(Duration(days: 5))),
      EmptyModel(today.subtract(Duration(days: 4))),
      EmptyModel(today.subtract(Duration(days: 3))),
      EmptyModel(today.subtract(Duration(days: 2))),
      EmptyModel(today.subtract(Duration(days: 1))),
      EmptyModel(today),
    ];

    return [
      charts.Series<EmptyModel, String>(
          data: series,
          domainFn: (EmptyModel datum, int index) {
            DateTime today = DateTime.now();

            if (today.year == datum.timestamp.year &&
                today.month == datum.timestamp.month &&
                today.day == datum.timestamp.day) {
              return '今日';
            } else {
              return '${datum.timestamp.month}.${datum.timestamp.day}';
            }
          },
          measureFn: (EmptyModel datum, int index) => 0,
          id: 'empty_series')
        ..setAttribute(charts.measureAxisIdKey, 'secondaryMeasureAxisId')
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        charts.BarChart(
          EmptyMasteryBlock._createSeries(),
          animate: false,
          defaultInteractions: false,
          domainAxis: charts.OrdinalAxisSpec(
              showAxisLine: false,
              scaleSpec: FixedPixelOrdinalScaleSpec(13),
              renderSpec: charts.GridlineRendererSpec(
                  lineStyle:
                      charts.LineStyleSpec(color: charts.Color.transparent),
                  labelOffsetFromAxisPx: 10,
                  labelStyle: charts.TextStyleSpec(
                      fontSize: 13,
                      color: charts.Color.fromHex(code: '#7c7a81')))),
          secondaryMeasureAxis: charts.NumericAxisSpec(
              tickProviderSpec: charts.StaticNumericTickProviderSpec([
                charts.TickSpec(100),
                charts.TickSpec(75),
                charts.TickSpec(50),
                charts.TickSpec(25),
                charts.TickSpec(0),
              ]),
              showAxisLine: false,
              renderSpec: charts.GridlineRendererSpec(
                  labelJustification: charts.TickLabelJustification.outside,
                  tickLengthPx: -10,
                  labelStyle: charts.TextStyleSpec(
                      color: charts.Color.fromHex(code: '#bdbcc0'),
                      fontSize: 11),
                  lineStyle: charts.LineStyleSpec(
                      dashPattern: [2],
                      color: charts.Color.fromHex(code: '#c8c8ca')))),
        ),
        Positioned(
            top: 100,
            child: SizedBox(
                width: 156,
                child: Wrap(
                  runAlignment: WrapAlignment.center,
                  children: <Widget>[
                    Text('     完成单词专项训练，\n可解锁你的词汇掌握度哦～',
                        style: TextStyle(
                            fontSize: 13,
                            color: Color(0xff7c7a81),
                            height: 1.2))
                  ],
                )))
      ],
    );
  }
}

class EmptyModel {
  DateTime timestamp;

  EmptyModel(this.timestamp);
}
