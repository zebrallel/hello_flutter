import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:hello_world/pages/knowledge/empty_mastery_block.dart';
import 'package:hello_world/pages/knowledge/mock.dart';
import 'package:charts_common/src/chart/cartesian/axis/spec/ordinal_axis_spec.dart'
    show FixedPixelOrdinalScaleSpec;
import 'package:hello_world/pages/knowledge/model/MasteryData.dart';
import 'custom_bar_label_decorator.dart' as cbld;

class MasteryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Container(
          padding: EdgeInsets.all(20), child: MasteryBlock()),
    );
  }
}

class LimitedMasteryBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Image.asset(
          'assets/images/image_chart@2x.png',
          width: double.infinity,
        ),
        Positioned(
            bottom: 20,
            child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xfff8f8f8),
                    borderRadius: BorderRadius.circular(22)),
                width: 173,
                height: 44,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/icon_glyphs_lock_light_24@2x.png',
                      width: 24,
                      height: 24,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text('加入会员可查看',
                          style: TextStyle(
                              color: Color(0xff7c7a81),
                              fontSize: 13,
                              fontWeight: FontWeight.w600)),
                    ),
                    Image.asset(
                      'assets/images/icon_actions_arrow_right_secondary_light_12@2x.png',
                      width: 12,
                      height: 12,
                    ),
                  ],
                )))
      ],
    );
  }
}

class MasteryBlock extends StatelessWidget {
  static final Map sumMap = Map();

  static List<charts.Series<MasteryModel, String>> _initChartData() {
    return MasteryLevel.values.map((level) {
      final List<MasteryModel> data = [];
      final List<MasteryData> md =
          masteryMockData.map((_) => MasteryData.fromJson(_)).toList();

      md.forEach((_) {
        final item = _.details.firstWhere((__) => (__.type == level.index + 1),
            orElse: () => null);

        if (item != null) {
          data.add(MasteryModel(
              DateTime.fromMillisecondsSinceEpoch(_.timestamp * 1000,
                  isUtc: true),
              _.studied,
              item.value ?? 0));
        }

        int sum = _.details.fold(0, (value, el) => value + el.value);
        sumMap[_.timestamp] = sum;
      });

      return charts.Series<MasteryModel, String>(
          id: 'type_$level',
          data: data,
          domainFn: (MasteryModel mm, _) {
            DateTime today = DateTime.now();

            if (today.day == mm.timestamp.day &&
                today.month == mm.timestamp.month) {
              return '今日';
            } else {
              return '${mm.timestamp.month}.${mm.timestamp.day}';
            }
          },
          measureFn: (MasteryModel mm, _) => mm.value,
          labelAccessorFn: (MasteryModel mm, _) => level == MasteryLevel.weak
              ? sumMap[mm.timestamp.millisecondsSinceEpoch / 1000].toString()
              : '',
          colorFn: (MasteryModel mm, _) => mm.studied
              ? levelColors[level.index]
              : noStudiedLevelColors[level.index])
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
    return Column(
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
                  'assets/images/icon_actions_info_light_18@2x.png',
                  height: 18,
                  width: 18,
                ))
          ],
        ),
        Container(
          padding: EdgeInsets.only(top: 8),
          height: 290,
          child: charts.BarChart(
            MasteryBlock._initChartData(),
            animate: false,
            defaultInteractions: false,
            defaultRenderer: charts.BarRendererConfig(
              cornerStrategy: charts.ConstCornerStrategy(3),
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
                    lineStyle:
                        charts.LineStyleSpec(color: charts.Color.transparent),
                    labelOffsetFromAxisPx: 10,
                    labelStyle: charts.TextStyleSpec(
                        fontSize: 13,
                        color: charts.Color.fromHex(code: '#7c7a81')))),
            secondaryMeasureAxis: charts.NumericAxisSpec(
                tickProviderSpec: charts.StaticNumericTickProviderSpec(
                    MasteryBlock._calcMeasureTicks()),
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
        )
      ],
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

final noStudiedLevelColors = [
  charts.Color.fromHex(code: '#ffefbe'),
  charts.Color.fromHex(code: '#fde2b1'),
  charts.Color.fromHex(code: '#ebd0b1'),
  charts.Color.fromHex(code: '#cfbeb1'),
];

class MasteryModel {
  final DateTime timestamp;
  final bool studied;
  final int value;

  MasteryModel(this.timestamp, this.studied, this.value);

  @override
  String toString() {
    return '${this.value} ${this.studied} ${this.timestamp.toLocal()}';
  }
}
