import 'package:flutter/material.dart';

import '../../../widgets/Text/custom_text.dart';
import '../../../widgets/Text/font_family.dart';

class SignButtons extends StatelessWidget {
  const SignButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        TextButton(
          onPressed: () => print("SIGN IN"),
          child: const CustomText(
            "Entrar",
            fontSize: 18,
            fontFamily: FontFamily.montserrat,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () => print("SIGN UP"),
          child: const CustomText(
            "Registrar",
            fontSize: 18,
            fontFamily: FontFamily.montserrat,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
