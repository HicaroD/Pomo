import 'package:flutter/material.dart';

import '../../../widgets/text/custom_text.dart';
import '../../../widgets/text/font_family.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const CustomText(
        "Esqueceu sua senha?",
        fontWeight: FontWeight.bold,
        fontFamily: FontFamily.montserrat,
      ),
    );
  }
}
