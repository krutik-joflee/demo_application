import 'package:flutter/material.dart';

class Demoimage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/instagram.png",
      height: MediaQuery.of(context).size.width / 2,
    );
  }
}
