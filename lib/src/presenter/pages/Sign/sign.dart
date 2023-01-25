import 'package:flutter/material.dart';

class SignPage extends StatelessWidget {
  const SignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        color: Colors.black,
        child: Column(
          children: const <Widget>[
            Text("Hícaro"),
          ],
        ),
      ),
    );
  }
}
