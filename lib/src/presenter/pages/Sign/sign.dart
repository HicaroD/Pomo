import 'package:flutter/material.dart';

import '../../widgets/Buttons/primary_button.dart';
import '../../widgets/FormManager/form_field_content.dart';
import '../../widgets/FormManager/form_manager.dart';
import 'components/sign_buttons.dart';
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
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        color: PomoColors.SECONDARY_RED,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 15),
            const SignPageHeader(),
            const SizedBox(height: 20),
            const SignButtons(),
            const SizedBox(height: 30),
            SizedBox(
              width: screenSize.width * 0.8,
              child: Column(
                children: <Widget>[
                  signInForms.buildForms(),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 150,
                    child: PrimaryButton(
                      onPressed: () => print("CLICKING"),
                      text: "Entrar",
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
