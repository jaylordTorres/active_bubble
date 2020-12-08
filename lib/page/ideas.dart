import 'package:flutter/material.dart';
import '../constant/main.dart';
import '../widget/widget.dart';

class IdeasPage extends StatelessWidget {
  static UiRoutes route = UiRoutes.root;
  const IdeasPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UiPage(child: Scaffold(body: Text('ideas page')));
  }
}
