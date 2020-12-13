import 'package:active_bubble/page/ideas.dart';
import 'package:active_bubble/page/root.dart';
import 'package:flutter/material.dart';

import 'package:active_bubble/class/ui_route_item.dart';
import 'package:active_bubble/constant/route.dart';
import 'package:active_bubble/page/guest_init.dart';
import 'package:active_bubble/util/util.dart';

// import '../class/class.dart';
// import '../page/page.dart';
// import '../constant/main.dart';
// import '../util/util.dart';

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
