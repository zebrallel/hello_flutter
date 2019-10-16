import 'package:hello_world/pages/chart_selection_callback.dart';
import 'package:hello_world/pages/charts.dart';
import 'package:hello_world/pages/constructor.dart';
import 'package:hello_world/pages/counter.dart';
import 'package:hello_world/pages/layout.dart';
import 'package:hello_world/pages/line_slide_chart.dart';
import 'package:hello_world/pages/loading.dart';
import 'package:hello_world/pages/paint.dart';
import 'package:hello_world/pages/stack_bar_chart.dart';

final routeConfigs = {
  'loading': (context) => LoadingPage(),
  'counter': (context) => CounterPage(),
  'layout': (context) => LayoutPage(),
  'constructors': (context) => ConstructorPage(),
  'progress circle': (context) => ProgressCirclePage(),
  'bar chart': (context) => ChartsPage(),
  'stack bar chart': (context) => StackedBarChart.withSampleData(),
  'chart selection callback': (context) => ChartSelectionCallbackPage(),
  'slider line chart': (context) => SliderLinePage.withSampleData()
};
