import 'dart:convert';
import 'package:demo_application/widget/drawer.dart';
import 'package:demo_application/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

class HomepageSB extends StatefulWidget {
  const HomepageSB({Key? key}) : super(key: key);

  @override
  State<HomepageSB> createState() => _HomepageSBState();
}

class _HomepageSBState extends State<HomepageSB> {
  Future getData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    var data;

    var result = await https.get(url);
    print(data);
    data = jsonDecode(result.body);
    return data;
  }

  Stream<List<String>> getStreamData() {
    var data = Stream<List<String>>.fromIterable(
        [List<String>.generate(20, (index) => "Item $index")]);
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
        body: StreamBuilder(
            stream: getStreamData(),
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
                            title: Text(snapshot.data[index]),
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
