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

  @override
  void initState() {
    _initApp();
    super.initState();
  }

  void _initApp() async {
    final storage = await SharedPreferences.getInstance();
    Store.storage = storage;
    setState(() {
      _initialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_initialized == false) {
      return Container();
    }
    return MaterialApp(
      theme: themeData,
      initialRoute: uiRoutes[UiRoutes.ideas],
      routes: uiRoutePages,
    );
  }
}
