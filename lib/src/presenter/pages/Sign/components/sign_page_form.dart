import 'package:flutter/material.dart';

import '../../../widgets/Buttons/primary_button.dart';
import '../../../widgets/FormManager/form_field_content.dart';
import '../../../widgets/FormManager/form_manager.dart';

class SignPageForm extends StatefulWidget {
  final bool isSignInForm;

  const SignPageForm({
    Key? key,
    required this.isSignInForm,
  }) : super(key: key);

  @override
  State<SignPageForm> createState() => _SignPageFormState();
}

class _SignPageFormState extends State<SignPageForm> {
  bool get _isSignInForm => widget.isSignInForm;

  final signInForms = FormManager(
    formKey: GlobalKey<FormState>(),
    formContent: <String, FormFieldContent>{
      "email": FormFieldContent(
        labelText: "E-mail",
        hintText: "Entre com seu e-mail",
      ),
      "password": FormFieldContent(
        labelText: "Senha",
        hintText: "Digite sua senha",
      ),
    },
  );

  final signUpForms = FormManager(
    formKey: GlobalKey<FormState>(),
    formContent: <String, FormFieldContent>{
      "name": FormFieldContent(
        labelText: "Nome",
        hintText: "Digite seu nome completo",
      ),
      "username": FormFieldContent(
        labelText: "Nome de usuário",
        hintText: "Digite seu nome de usuário",
      ),
      "email": FormFieldContent(
        labelText: "E-mail",
        hintText: "Entre com seu e-mail",
      ),
      "password": FormFieldContent(
        labelText: "Senha",
        hintText: "Digite sua senha",
      ),
    },
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _isSignInForm ? signInForms.buildForms() : signUpForms.buildForms(),
        const SizedBox(height: 30),
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
    Map<String, String> data = signInForms.data();
    if (!_isSignInForm) {
      data = signUpForms.data();
    }
    print(data);
  }

  @override
  void dispose() {
    signInForms.disposeControllers();
    signUpForms.disposeControllers();
    super.dispose();
  }
}
