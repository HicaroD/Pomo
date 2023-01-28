import 'package:flutter/material.dart';

import '../../../widgets/Buttons/primary_button.dart';
import '../../../widgets/FormManager/form_manager.dart';

class SignPageForm extends StatefulWidget {
  final bool isSignInForm;
  final FormManager signInForms;
  final FormManager signUpForms;

  const SignPageForm({
    Key? key,
    required this.isSignInForm,
    required this.signInForms,
    required this.signUpForms,
  }) : super(key: key);

  @override
  State<SignPageForm> createState() => _SignPageFormState();
}

class _SignPageFormState extends State<SignPageForm> {
  bool get _isSignInForm => widget.isSignInForm;
  FormManager get signInForms => widget.signInForms;
  FormManager get signUpForms => widget.signUpForms;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _isSignInForm ? signInForms.buildForms() : signUpForms.buildForms(),
        SizedBox(
          width: 150,
          child: PrimaryButton(
            onPressed: _sign,
            text: _isSignInForm ? "Entrar" : "Registrar",
          ),
        )
      ],
    );
  }

  void _sign() {
    if (!mounted) return;

    Map<String, String> data = signInForms.data();
    if (!_isSignInForm) {
      data = signUpForms.data();
    }
    print(data);
  }
}
