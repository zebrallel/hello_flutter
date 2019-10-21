import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:hello_world/pages/knowledge/mock.dart';
import 'package:charts_common/src/chart/cartesian/axis/spec/ordinal_axis_spec.dart'
    show FixedPixelOrdinalScaleSpec;
import 'custom_bar_label_decorator.dart' as cbld;

class MasteryPage extends StatelessWidget {
  static final Map sumMap = Map();

  static List<charts.Series<MasteryModel, String>> _initChartData() {
    return MasteryLevel.values.map((level) {
      final List<MasteryModel> data = [];

      masteryMockData.forEach((_) {
        final item = (_['detail'] as List).firstWhere(
            (__) => (__['type'] == level.index + 1),
            orElse: () => null);

        if (item != null) {
          data.add(MasteryModel(
              DateTime.fromMillisecondsSinceEpoch(
                  (_['timestamps'] as int) * 1000,
                  isUtc: true),
              _['studied'],
              item['value'] ?? 0));
        }

        int sum =
            (_['detail'] as List).fold(0, (value, el) => value + el['value']);
        sumMap[_['timestamps']] = sum;
      });

      return charts.Series<MasteryModel, String>(
          id: 'type_$level',
          data: data,
          domainFn: (MasteryModel mm, _) =>
              '${mm.timestamps.month}.${mm.timestamps.day}',
          measureFn: (MasteryModel mm, _) => mm.value,
          labelAccessorFn: (MasteryModel mm, _) => level == MasteryLevel.weak
              ? sumMap[mm.timestamps.millisecondsSinceEpoch / 1000].toString()
              : '',
          colorFn: (MasteryModel mm, _) => levelColors[level.index])
        ..setAttribute(charts.measureAxisIdKey, 'secondaryMeasureAxisId');
    }).toList();
  }

  static List<charts.TickSpec<int>> _calcMeasureTicks() {
    int maxSum = 0;

    sumMap.keys.forEach((key) {
      if (sumMap[key] > maxSum) {
        maxSum = sumMap[key];
      }
    });

    int maxTickValue = (maxSum / 100).ceil() * 100;

    return [
      charts.TickSpec(maxTickValue),
      charts.TickSpec((maxTickValue / 4 * 3).round()),
      charts.TickSpec((maxTickValue / 4 * 2).round()),
      charts.TickSpec((maxTickValue / 4 * 1).round()),
      charts.TickSpec((maxTickValue / 4 * 0).round()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  '近7日词汇掌握情况',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(124, 122, 129, 1),
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 3, top: 0),
                    child: Image.asset(
                      'assets/images/info.png',
                      height: 18,
                      width: 18,
                    ))
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 8),
              height: 290,
              child: charts.BarChart(
                MasteryPage._initChartData(),
                animate: false,
                defaultInteractions: false,
                defaultRenderer: charts.BarRendererConfig(
                  cornerStrategy: charts.ConstCornerStrategy(3),
                  strokeWidthPx: 1,
                  groupingType: charts.BarGroupingType.stacked,
                  barRendererDecorator: cbld.BarLabelDecorator(
                      labelMaxWidth: 40,
                      labelPosition: cbld.BarLabelPosition.outside,
                      outsideLabelStyleSpec: charts.TextStyleSpec(
                          fontSize: 11,
                          color: charts.Color.fromHex(code: '#25222d'))),
                ),
                domainAxis: charts.OrdinalAxisSpec(
                    showAxisLine: false,
                    scaleSpec: FixedPixelOrdinalScaleSpec(13),
                    renderSpec: charts.GridlineRendererSpec(
                        lineStyle: charts.LineStyleSpec(
                            color: charts.Color.transparent),
                        labelOffsetFromAxisPx: 10,
                        labelStyle: charts.TextStyleSpec(
                            fontSize: 13,
                            color: charts.Color.fromHex(code: '#7c7a81')))),
                secondaryMeasureAxis: charts.NumericAxisSpec(
                    tickProviderSpec: charts.StaticNumericTickProviderSpec(
                        MasteryPage._calcMeasureTicks()),
                    showAxisLine: false,
                    renderSpec: charts.GridlineRendererSpec(
                        labelStyle: charts.TextStyleSpec(
                            color: charts.Color.fromHex(code: '#bdbcc0'),
                            fontSize: 11),
                        lineStyle: charts.LineStyleSpec(
                            dashPattern: [2],
                            color: charts.Color.fromHex(code: '#c8c8ca')))),
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum MasteryLevel { weak, fine, good, excellent }

final levelColors = [
  charts.Color.fromHex(code: '#ffca29'),
  charts.Color.fromHex(code: '#f79e00'),
  charts.Color.fromHex(code: '#bd6500'),
  charts.Color.fromHex(code: '#602800'),
];

class MasteryModel {
  final DateTime timestamps;
  final bool studied;
  final int value;

  MasteryModel(this.timestamps, this.studied, this.value);

  @override
  String toString() {
    return '${this.value} ${this.studied} ${this.timestamps.toLocal()}';
  }
}
