// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

import 'package:api_integration_mysql/ui/login_user.dart';
import 'package:api_integration_mysql/uicontroller/everyhandtool.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Successfully Logged In "),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                close(context, LoginUserState());
              },
              child: const Text("go back"),
            ),
          ],
        ),
      ),
    );
  }
}
