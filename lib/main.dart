import 'package:demo_application/pages/home_page.dart' show Homepage;
import 'package:demo_application/pages/home_page_with_fb.dart';
import 'package:demo_application/pages/home_page_with_sb.dart';
import 'package:demo_application/pages/login_page.dart';
import 'package:demo_application/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "demo app",
      home: Constants.prefs.getBool("LoggedIn") == true
          ? HomepageSB()
          : loginpage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routes: {
        "/login": (context) => loginpage(),
        "/home": (context) => Homepage()
      },
    ),
  );
}
