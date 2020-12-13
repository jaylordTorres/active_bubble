import 'package:flutter/material.dart' show runApp;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';
import 'class/store.dart';

void main() async {
  // await DotEnv().load('.env');
  // final key = DotEnv().env['API_KEY'];
  // if (key.isEmpty) {
  //   print('APi key required');
  //   return;
  // }
  // set api key
  // ApiConstant.key = key;

  // validate app

  await Firebase.initializeApp();
  await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
  Store.storage = await SharedPreferences.getInstance();

  runApp(MainApp());
}
