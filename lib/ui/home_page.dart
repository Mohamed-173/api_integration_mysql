import 'package:api_integration_mysql/uicontroller/everyhandtool.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

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
                        decoration: InputDecoration(
                          label: Text("Email"),
                        ),
                      ),
                      TextFormField(
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
            )
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
