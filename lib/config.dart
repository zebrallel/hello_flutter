import 'package:hello_world/pages/font_runtime.dart';
import 'package:hello_world/pages/key_page.dart';
import 'package:hello_world/pages/provider.dart';

final routeConfigs = {
  'Provider': (context) => ProviderPage(),
  "Key的使用": (context) => KeyPage(),
  "font资源动态加载": (contet) => FontDynamicPage()
};
