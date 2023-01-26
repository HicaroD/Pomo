import 'package:flutter/material.dart';

import '../../widgets/Buttons/primary_button.dart';
import '../../widgets/Buttons/secondary_button.dart';
import '../../widgets/FormManager/form_field_content.dart';
import '../../widgets/FormManager/form_manager.dart';
import 'components/sign_header.dart';
import '../../../utils/colors.dart';

class SignPage extends StatefulWidget {
  const SignPage({Key? key}) : super(key: key);

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
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

  bool _isSignInForm = true;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        color: PomoColors.SECONDARY_RED,
        child: Column(
          children: <Widget>[
            const SignPageHeader(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SecondaryButton(
                  "Entrar",
                  onPressed: () {
                    setState(() {
                      _isSignInForm = true;
                    });
                  },
                  hasBottomBorder: _isSignInForm,
                ),
                SecondaryButton(
                  "Registrar",
                  onPressed: () {
                    setState(() {
                      _isSignInForm = false;
                    });
                  },
                  hasBottomBorder: !_isSignInForm,
                ),
              ],
            ),
            SizedBox(
              width: screenSize.width * 0.8,
              child: Column(
                children: <Widget>[
                  _isSignInForm
                      ? signInForms.buildForms()
                      : signUpForms.buildForms(),
                  SizedBox(
                    width: 150,
                    child: PrimaryButton(
                      onPressed: () => print("CLICKING"),
                      text: _isSignInForm ? "Entrar" : "Registrar",
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    signInForms.disposeControllers();
    signUpForms.disposeControllers();
  }
}
