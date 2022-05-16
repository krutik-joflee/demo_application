import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: "demo app",
    home: Homepage(),
  ));
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Demo App")),
      body: Container(
        child: const Center(child: Text("Hii Krutik")),
      ),
    );
  }
}
