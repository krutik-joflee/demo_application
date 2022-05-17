import 'package:demo_application/drawer.dart';
import 'package:demo_application/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'columnwidget.dart';

void main() {
  runApp(
    MaterialApp(
      title: "demo app",
      home: const Homepage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    ),
  );
}
