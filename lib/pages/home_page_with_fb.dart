import 'dart:convert';
import 'package:demo_application/widget/drawer.dart';
import 'package:demo_application/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

import '../model/api_model.dart';

class HomepageFB extends StatefulWidget {
  const HomepageFB({Key? key}) : super(key: key);

  @override
  State<HomepageFB> createState() => _HomepageFBState();
}

class _HomepageFBState extends State<HomepageFB> {
  Future getData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    var data;

    var result = await https.get(url);
    print(data);
    data = jsonDecode(result.body);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text("Awesome App"),
          actions: [
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  Constants.prefs.setBool("LoggedIn", false);
                  Navigator.pushReplacementNamed(context, "/login");
                }),
          ],
        ),
        body: FutureBuilder(
            future: getData(),
            builder: (context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: Text("Fetch Something"),
                  );
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Some Error Occured"),
                    );
                  }
                  return ListView.builder(
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(snapshot.data[index]["title"]),
                            subtitle:
                                Text("ID : ${snapshot.data[index]["id"]}"),
                            leading: Image.network(snapshot.data[index]["url"]),
                          ),
                        );
                      }),
                      itemCount: snapshot.data.length);
              }
            }),
        drawer: MyDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // MyText = _namecontroller.text;
            // setState(() {});
          },
          child: const Icon(Icons.refresh),
        ));
  }
}
