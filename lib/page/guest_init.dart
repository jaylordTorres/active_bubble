import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constant/main.dart';
import '../widget/widget.dart';

class GuestInitPage extends StatefulWidget {
  static UiRoutes route = UiRoutes.root;
  const GuestInitPage({Key key}) : super(key: key);

  @override
  _GuestInitPageState createState() => _GuestInitPageState();
}

class _GuestInitPageState extends State<GuestInitPage> {
  bool loading = false;
  void _loginAsGuest() async {
    setState(() {
      loading = true;
    });
    await FirebaseAuth.instance.signInAnonymously();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return UiPage(
        child: Scaffold(
            body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 2,
            child: Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('AB', style: Theme.of(context).textTheme.headline1),
                Text(
                  'Active Bubble',
                  style: Theme.of(context).textTheme.headline3,
                )
              ],
            ))),
        Expanded(
          flex: 1,
          child: Container(),
        ),
        ElevatedButton(
            onPressed: loading ? null : _loginAsGuest,
            child: Text('Login as Guest'))
      ],
    )));
  }
}
