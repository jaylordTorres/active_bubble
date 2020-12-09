import 'package:flutter/material.dart';

import '../class/class.dart';
import '../page/page.dart';
import '../constant/main.dart';
import '../util/util.dart';

final _guestPages = [
  UiRouteItem(
    uiRoutes[RootPage.route],
    RootPage.route,
    (_) => RootPage(),
  ),
  UiRouteItem(
    uiRoutes[GuestInitPage.route],
    GuestInitPage.route,
    (_) => GuestInitPage(),
  ),
];

final _userPages = [
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

final Map<String, WidgetBuilder> uiGuestRoutePages = generatePages(_guestPages);

final Map<String, WidgetBuilder> uiUserRoutePages = generatePages(_userPages);
