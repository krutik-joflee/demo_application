import 'package:demo_application/columnwidget.dart';
import 'package:demo_application/drawer.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController _namecontroller = TextEditingController();
  var MyText = "Change Me";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(title: const Text("Awesome App")),
        body: ColumnWidget(MyText: MyText, namecontroller: _namecontroller),
        drawer: MyDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            MyText = _namecontroller.text;
            setState(() {});
          },
          child: const Icon(Icons.refresh),
        ));
  }
}
