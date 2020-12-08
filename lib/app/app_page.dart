import 'package:flutter/material.dart';

import '../class/class.dart';
import '../page/page.dart';
import '../constant/main.dart';

final _pages = [
  UiRouteItem(
    uiRoutes[RootPage.route],
    RootPage.route,
    (_) => RootPage(),
  ),
  UiRouteItem(
    uiRoutes[IdeasPage.route],
    IdeasPage.route,
    (_) => IdeasPage(),
  ),
];

final Map<String, WidgetBuilder> uiRoutePages = Map.fromEntries(_pages
    .map((UiRouteItem page) =>
        MapEntry<String, WidgetBuilder>(page.path, page.builder))
    .toList());
