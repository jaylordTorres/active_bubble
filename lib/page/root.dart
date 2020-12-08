import 'package:flutter/material.dart';
import '../constant/main.dart';

class RootPage extends StatelessWidget {
  static UiRoutes route = UiRoutes.root;
  const RootPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Text('Root page'),
          ElevatedButton(
            child: Text('sample'),
            onPressed: () {},
          )
        ],
      )),
    );
  }
}
