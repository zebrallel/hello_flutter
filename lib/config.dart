import 'package:hello_world/pages/any.dart';
import 'package:hello_world/pages/change_notifier.dart';
import 'package:hello_world/pages/font_runtime.dart';
import 'package:hello_world/pages/inherit_widget.dart';
import 'package:hello_world/pages/key_page.dart';
import 'package:hello_world/pages/listview.dart';
import 'package:hello_world/pages/provider.dart';

final routeConfigs = {
  'Provider': (context) => ProviderPageSecond(),
  "Key的使用": (context) => KeyPage(),
  "font资源动态加载": (contet) => FontDynamicPage(),
  "changeNotifier": (context) => ChangeNotifierDemo(),
  'inherit widget': (context) => InheritWidgetDemo(),
  'list view page': (context) => ListViewPage(),
  'any page': (context) => AnyPage(),
};
