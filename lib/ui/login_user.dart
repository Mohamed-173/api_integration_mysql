import 'dart:convert';

import 'package:api_integration_mysql/ui/register_user.dart';
import 'package:api_integration_mysql/ui/welcome_page.dart';
import 'package:api_integration_mysql/uicontroller/everyhandtool.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginUserState extends StatefulWidget {
  const LoginUserState({Key? key}) : super(key: key);

  @override
  State<LoginUserState> createState() => _LoginUserStateState();
}

class _LoginUserStateState extends State<LoginUserState> {
  bool visible = false;
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future login(BuildContext context) async {
    setState(() {
      visible = true;
    });
    if (emailController.text == "" || passwordController.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("please  email and password not be empty! ")));
    } else {
      var data = {
        'email': emailController.text,
        'password': passwordController.text,
      };

      var urlOnline =
          "https://mysqlflutteronline.000webhostapp.com/login_user.php";
      var response =
          await http.post(Uri.parse(urlOnline), body: jsonEncode(data));

      final message = json.decode(response.body);

      // this code for login
      if (message == "Login Matched") {
        setState(() {
          visible = false;
        });
        if (mounted) {
          to(context, const WelcomePage());
        }
      } else {
        setState(() {
          visible = false;
        });
        // print("wrong");
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
            ),
          );
        }
      }
    }
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
                        controller: emailController,
                        decoration: const InputDecoration(
                          label: Text("Email"),
                        ),
                      ),
                      TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                          label: Text("Password"),
                        ),
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 5,
            ),

            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
              onPressed: () {
                // login(context);
                login(context);
              },
              child: const Text("Login"),
            ),
            const SizedBox(
              height: 5,
            ),
            TextButton(
              onPressed: () {
                to(context, const ResgisterUserState());
              },
              child: const Text("New user? Register Now"),
            ),
            Visibility(
                visible: visible,
                child: Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    child: const CircularProgressIndicator())),
          ],
        ),
      ),
    );
  }

  AppBar appBar() => AppBar(
        title: const Text(
          "Login Page ",
        ),
        centerTitle: true,
      );
}
