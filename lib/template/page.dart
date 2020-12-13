import 'package:active_bubble/widget/page.dart';
import 'package:flutter/material.dart';

import '../constant/route.dart';

class TemplatePage extends StatelessWidget {
  static UiRoutes route = UiRoutes.root;
  const TemplatePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UiPage(child: Scaffold(body: Text('page')));
  }
}
