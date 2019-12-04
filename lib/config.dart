import 'package:flutter/material.dart';
import 'package:hello_world/components/layout.dart';
import 'package:hello_world/pages/animation/animation.dart';
import 'package:hello_world/pages/charts/basic_bar_chart.dart';
import 'package:hello_world/pages/counter.dart';
import 'package:hello_world/pages/customScrollView.dart';
import 'package:hello_world/pages/flow.dart';
import 'package:hello_world/pages/knowledge/explanation.dart';
import 'package:hello_world/pages/knowledge/mastery.dart';
import 'package:hello_world/pages/layout.dart';
import 'package:hello_world/pages/navigator.dart';
import 'package:hello_world/pages/provider.dart';
import 'package:hello_world/pages/study_plan/bootstrap.dart';
import 'package:hello_world/pages/study_plan/study_plan.dart';
import 'package:hello_world/pages/ui.dart';
import 'package:hello_world/pages/vocabulary/vocabulary.dart';

final routeConfigs = {
  'AnyThing': (context) => AnyThing(),
  '柱状图': (context) => BasicBarChartPage(),
  '掌握度': (context) => MasteryPage(),
  '我的词汇量': (context) => VocabularyPage(),
  '掌握度解释': (context) => ExplanationPage(),
  'Overlay': (context) => MyHomePage(),
  'ui page': (context) => UIPage(),
  'Provider': (context) => ProviderPage(),
  '我的学习计划': (context) => StudyPlanPage(),
  'ScrollToDemo': (context) => FlowPage(),
  'CustomScrollView': (context) => CustomScrollViewPage(),
  'MultiChildLayoutDelegate': (context) => LayoutPage(),
  'Navigator Demo': (context) => NavigatorDemoPage(),
  "Animations": (context) => AnimationPage(),
  'Study Plan Bootstrap': (context) => StudyPlanBootstrap()
};

class AnyThing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout(
        padding: 20,
        child: SingleChildScrollView(
          child: Row(
            children: <Widget>[
              Container(
                width: 100,
                color: Colors.teal,
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(left: 10),
                width: double.infinity,
                height: 500,
                color: Colors.cyan,
              ))
            ],
          ),
        ));
  }
}
