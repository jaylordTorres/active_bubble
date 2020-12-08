import 'package:flutter/material.dart';

/// Bind all resolvers here
class UiPage extends StatelessWidget {
  final Widget child;
  const UiPage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: child,
    );
  }
}
