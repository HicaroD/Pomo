import 'package:flutter/material.dart';
import 'package:pomo_app/src/presenter/widgets/DialogManager/dialog_manager.dart';
import 'package:pomo_app/src/presenter/widgets/DialogManager/dialog_type.dart';

import '../../../widgets/Text/custom_text.dart';
import '../../../widgets/Text/font_family.dart';

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
