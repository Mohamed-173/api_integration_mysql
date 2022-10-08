import 'dart:convert';

import 'package:api_integration_mysql/ui/welcome_page.dart';
import 'package:api_integration_mysql/uicontroller/everyhandtool.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();

  Future login(BuildContext context) async {
    if (username.text == "" || password.text == "") {
      // print("empty");
      // return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("please the not be empty username and password")));
    } else {
      var url = "http://192.168.1.7/localconnection/login.php";
      var response = await http.post(Uri.parse(url), body: {
        'username': username.text,
        'password': password.text,
      });
      // var data = json.decode(response.body.toString());
      final data = json.decode(response.body);
      if (data == 'success') {
        // print("done");
        to(context, const WelcomePage());
      } else {
        // print("wrong");
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("the user and password combination does not exist")));
      }
    }
  }

  void t() {
    print("object");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /////TODO: buetifull icon   done
            const SizedBox(
              height: 100,
              width: 100,
              child: Icon(Icons.flutter_dash, size: 100),
            ),
            const SizedBox(
              height: 5,
            ),

            SizedBox(
              width: getWidth(context, 75),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: username,
                        decoration: InputDecoration(
                          label: Text("Email"),
                        ),
                      ),
                      TextFormField(
                        controller: password,
                        decoration: InputDecoration(
                          label: Text("Password"),
                        ),
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 5,
            ),
            Text("this is password text field"),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
              onPressed: () {
                login(context);
                // t();
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBar() => AppBar(
        title: const Text(
          "Welcome Home ",
        ),
        centerTitle: true,
      );
}
