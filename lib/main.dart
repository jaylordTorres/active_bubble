import 'package:active_bubble/class/store.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:active_news/constant/main.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app/app.dart';

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
