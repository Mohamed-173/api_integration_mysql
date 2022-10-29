import 'package:api_integration_mysql/ui/login_user.dart';
import 'package:flutter/material.dart';
import '../uicontroller/everyhandtool.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ResgisterUserState extends StatefulWidget {
  const ResgisterUserState({Key? key}) : super(key: key);

  @override
  State<ResgisterUserState> createState() => _ResgisterUserStateState();
}

class _ResgisterUserStateState extends State<ResgisterUserState> {
  bool visible = false;
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Future userRegistration() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    // Getting value from Controller
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    // SERVER API URL
    var url = 'https://mysqlflutteronline.000webhostapp.com/register_user.php';

    // Store all data with Param Name.
    var data = {'name': name, 'email': email, 'password': password};

    // Starting Web API Call.
    var response = await http.post(Uri.parse(url), body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }

    // Showing Alert Dialog with Response JSON Message.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
                        controller: nameController,
                        decoration: const InputDecoration(
                          label: Text("Name"),
                        ),
                      ),
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

                userRegistration();
              },
              child: const Text(" Click To Create Account"),
            ),

            TextButton(
              onPressed: () {
                close(context, const LoginUserState());
              },
              child: const Text("Already have an account?"),
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBar() => AppBar(
        title: const Text(
          "Register Page ",
        ),
        centerTitle: true,
      );
}
