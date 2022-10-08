import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("data"),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {},
              child: Text("go back"),
            ),
          ],
        ),
      ),
    );
  }
}
