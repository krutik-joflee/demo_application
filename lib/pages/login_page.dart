import 'package:demo_application/demo_image.dart';
import 'package:demo_application/pages/home_page.dart';
import 'package:demo_application/utils/constants.dart';
import 'package:flutter/material.dart';

class loginpage extends StatefulWidget {
  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  @override
  Widget build(BuildContext context) {
    final userNamecontroller = TextEditingController();
    final passwordcontroller = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Demoimage(),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                    child: Card(
                  child: Column(
                    children: [
                      Form(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Enter Username",
                                  labelText: "Username"),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Enter Password",
                                  labelText: "Password"),
                            )
                          ],
                        ),
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      RaisedButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => Homepage()),
                          // );
                          var prefs;
                          Constants.prefs.setBool("LoggedIn", true);
                          Navigator.pushReplacementNamed(context, "/home");
                        },
                        child: Text("Sign In"),
                        color: Colors.deepPurpleAccent,
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                )),
              ),
            ),
          ],
        ));
  }
}
