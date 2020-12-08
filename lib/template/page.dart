import 'package:flutter/material.dart';
import '../constant/main.dart';
import '../widget/widget.dart';

class TemplatePage extends StatelessWidget {
  static UiRoutes route = UiRoutes.root;
  const TemplatePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UiPage(child: Scaffold(body: Text('page')));
  }
}
