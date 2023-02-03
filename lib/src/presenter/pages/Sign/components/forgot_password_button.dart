import 'package:flutter/material.dart';

import '../../../widgets/Text/custom_text.dart';
import '../../../widgets/Text/font_family.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // TODO: implement forgot password functionality
        print("FORGOT PASSWORD");
      },
      child: const CustomText(
        "Esqueceu sua senha?",
        fontWeight: FontWeight.bold,
        fontFamily: FontFamily.montserrat,
      ),
    );
  }
}
