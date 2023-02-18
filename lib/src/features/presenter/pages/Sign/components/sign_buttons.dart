import 'package:flutter/material.dart';

import '../../../widgets/Buttons/secondary_button.dart';

class SignButtons extends StatelessWidget {
  final bool isSignInForm;
  final void Function(bool) onPressed;

  const SignButtons({
    Key? key,
    required this.isSignInForm,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SecondaryButton(
          "Entrar",
          onPressed: () => onPressed(true),
          hasBottomBorder: isSignInForm,
        ),
        SecondaryButton(
          "Registrar",
          onPressed: () => onPressed(false),
          hasBottomBorder: !isSignInForm,
        ),
      ],
    );
  }
}
