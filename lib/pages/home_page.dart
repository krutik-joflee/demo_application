import 'dart:convert';
import 'package:demo_application/widget/drawer.dart';
import 'package:demo_application/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController _namecontroller = TextEditingController();
  var MyText = "Change Me";
  var url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
  var data;

  get http => null;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var result = await https.get(url);
    print(data);
    data = jsonDecode(result.body);
    setState(() {});
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
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: data != null
              ? ListView.builder(
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(data[index]["title"]),
                        subtitle: Text("ID : ${data[index]["id"]}"),
                        leading: Image.network(data[index]["url"]),
                      ),
                    );
                  }),
                  itemCount: data.length)
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
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
