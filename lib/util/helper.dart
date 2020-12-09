import 'package:active_bubble/class/ui_route_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

String cleanTags(String htmlText) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  return htmlText.replaceAll(exp, '');
}

asyncWebLauncher(String url) async {
  try {
    if (await canLaunch(url)) {
      await launch(url);
      return true;
    }
  } catch (e) {}
  return false;
}

generatePages(List<UiRouteItem> pages) {
  return Map.fromEntries(pages
      .map((UiRouteItem page) =>
          MapEntry<String, WidgetBuilder>(page.path, page.builder))
      .toList());
}
