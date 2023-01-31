import 'package:flutter/material.dart';

import '../../../widgets/FormField/field_type.dart';
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
        fieldType: FieldType.email,
      ),
      "password": FormFieldContent(
        labelText: "Senha",
        hintText: "Digite sua senha",
        fieldType: FieldType.password,
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
        fieldType: FieldType.email,
      ),
      "password": FormFieldContent(
        labelText: "Senha",
        hintText: "Digite sua senha",
        fieldType: FieldType.password,
      ),
    },
  );

  bool _isSignInBttnActivated = false;
  bool _isSignUpBttnActivated = false;

  @override
  void initState() {
    super.initState();
    signInForms.addListener(_isButtonActivated);
    signUpForms.addListener(_isButtonActivated);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _isSignInForm ? signInForms.buildForms() : signUpForms.buildForms(),
        const SizedBox(height: 30),
        SizedBox(
          width: 150,
          child: _isSignInForm
              ? PrimaryButton(
                  onPressed: _isSignInBttnActivated ? _signIn : null,
                  text: "Entrar",
                )
              : PrimaryButton(
                  onPressed: _isSignUpBttnActivated ? _signUp : null,
                  text: "Registrar",
                ),
        )
      ],
    );
  }

  void _signIn() {
    Map<String, String> data = signInForms.data();
    print(data);
  }

  void _signUp() {
    Map<String, String> data = signUpForms.data();
    print(data);
  }

  void _isButtonActivated() {
    if (mounted) {
      setState(() {
        if (_isSignInForm) {
          _isSignInBttnActivated = signInForms.isValid();
          return;
        }
        _isSignUpBttnActivated = signUpForms.isValid();
      });
    }
  }

  @override
  void dispose() {
    signInForms.disposeControllers();
    signUpForms.disposeControllers();
    super.dispose();
  }
}
