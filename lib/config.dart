import 'package:hello_world/pages/bootstrap.dart';
import 'package:hello_world/pages/charts/basic_bar_chart.dart';
import 'package:hello_world/pages/charts/chart_selection_callback.dart';
import 'package:hello_world/pages/charts/charts.dart';
import 'package:hello_world/pages/constructor.dart';
import 'package:hello_world/pages/counter.dart';
import 'package:hello_world/pages/customScrollView.dart';
import 'package:hello_world/pages/flow.dart';
import 'package:hello_world/pages/knowledge/explanation.dart';
import 'package:hello_world/pages/knowledge/mastery.dart';
import 'package:hello_world/pages/layout.dart';
import 'package:hello_world/pages/charts/line_slide_chart.dart';
import 'package:hello_world/pages/navigator.dart';
import 'package:hello_world/pages/paint.dart';
import 'package:hello_world/pages/charts/stack_bar_chart.dart';
import 'package:hello_world/pages/provider.dart';
import 'package:hello_world/pages/study_plans/study_plans.dart';
import 'package:hello_world/pages/ui.dart';
import 'package:hello_world/pages/vocabulary/vocabulary.dart';

final routeConfigs = {
  '柱状图': (context) => BasicBarChartPage(),
  '掌握度': (context) => MasteryPage(),
  '我的词汇量': (context) => VocabularyPage(),
  '掌握度解释': (context) => ExplanationPage(),
  'Overlay': (context) => MyHomePage(),
  'ui page': (context) => UIPage(),
  'Provider': (context) => ProviderPage(),
  '我的学习计划': (context) => StudyPlans(),
  'ScrollToDemo': (context) => FlowPage(),
  'CustomScrollView': (context) => CustomScrollViewPage(),
  'MultiChildLayoutDelegate': (context) => LayoutPage(),
  'Navigator Demo': (context) => NavigatorDemoPage()
};
