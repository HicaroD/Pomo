import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../Buttons/secondary_button.dart';
import '../Text/custom_text.dart';
import '../Text/font_family.dart';

class CustomDialog extends StatelessWidget {
  final Icon icon;
  final String text;
  final String? buttonText;

  const CustomDialog({
    Key? key,
    required this.icon,
    required this.text,
    this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: icon,
      title: CustomText(
        text,
        fontFamily: FontFamily.montserrat,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      actions: <Widget>[
        Center(
          child: SecondaryButton(
            buttonText ?? "Okay",
            onPressed: () => Modular.to.pop(),
          ),
        ),
      ],
    );
  }
}
