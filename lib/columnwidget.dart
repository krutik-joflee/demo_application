import 'package:flutter/material.dart';

import 'demo_image.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({
    Key? key,
    required this.MyText,
    required TextEditingController namecontroller,
  })  : _namecontroller = namecontroller,
        super(key: key);

  final String MyText;
  final TextEditingController _namecontroller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Demoimage(),
        const SizedBox(
          height: 20,
        ),
        Text(
          MyText,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _namecontroller,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Something Here",
                labelText: "Name"),
          ),
        )
      ],
    );
  }
}
