import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/route.dart';
import '../class/class.dart';
import 'app_page.dart';
import 'theme_data.dart';

/// Main app wrapper
class MainApp extends StatefulWidget {
  const MainApp({Key key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _initialized = false;
  User _user;

  @override
  void initState() {
    _initApp();
    super.initState();
  }

  void _initApp() async {
    //
    // firebase
    //
    await Firebase.initializeApp();
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.authStateChanges().listen((user) {
      Store.user = user;
      setState(() {
        _user = user;
      });
    });

    //
    // local
    //
    final storage = await SharedPreferences.getInstance();
    Store.storage = storage;

    //
    //
    //
    setState(() {
      _initialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_initialized == false) {
      return Container();
    }
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      child: _user != null
          ? MaterialApp(
              key: Key(_user.uid),
              theme: themeData,
              initialRoute: uiRoutes[UiRoutes.ideas],
              routes: uiUserRoutePages,
            )
          : MaterialApp(
              theme: themeData,
              initialRoute: uiRoutes[UiRoutes.guestInit],
              routes: uiGuestRoutePages,
            ),
    );
  }
}
