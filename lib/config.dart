import 'package:hello_world/pages/charts.dart';
import 'package:hello_world/pages/counter.dart';
import 'package:hello_world/pages/layout.dart';
import 'package:hello_world/pages/loading.dart';
import 'package:hello_world/pages/stack_bar_chart.dart';

final routeConfigs = {
  'loading': (context) => LoadingPage(),
  'counter': (context) => CounterPage(),
  'layout': (context) => LayoutPage(),
  'bar chart': (context) => ChartsPage.withSampleData(),
  'stack bar chart': (context) => StackedBarChart.withSampleData()
};
