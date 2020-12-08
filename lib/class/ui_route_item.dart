import 'package:flutter/material.dart';
import '../constant/route.dart';

class UiRouteItem {
  final String path;
  final UiRoutes route;
  final WidgetBuilder builder;

  UiRouteItem(this.path, this.route, this.builder);
}
