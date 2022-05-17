import 'package:demo_application/drawer.dart';
import 'package:demo_application/pages/home_page.dart';
import 'package:demo_application/pages/login_page.dart';
import 'package:flutter/material.dart';

import 'columnwidget.dart';

void main() {
  runApp(
    MaterialApp(
      title: "demo app",
      home: loginpage(),
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
