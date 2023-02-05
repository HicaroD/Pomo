import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../domain/entities/sign_up_credentials_entity.dart';
import '../../../store/sign_up_store.dart';
import '../../../widgets/Buttons/primary_button.dart';
import '../../../widgets/FormField/field_type.dart';
import '../../../widgets/FormManager/form_field_content.dart';
import '../../../widgets/FormManager/form_manager.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
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

  bool _isSignButtonActivated = false;

  late SignUpStore signUpStore;

  @override
  void initState() {
    super.initState();
    signUpStore = Modular.get<SignUpStore>();
    signUpForms.addListener(_isButtonActivated);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        signUpForms.buildForms(),
        const SizedBox(height: 30),
        SizedBox(
          width: 150,
          child: PrimaryButton(
            onPressed: _isSignButtonActivated ? _signUp : null,
            text: "Entrar",
          ),
        ),
      ],
    );
  }

  void _signUp() async {
    Map<String, String> data = signUpForms.data();
    final credentials = SignUpCredentialsEntity(
      name: data["name"]!,
      username: data["username"]!,
      email: data["email"]!,
      password: data["password"]!,
    );

    await signUpStore.signUp(credentials);
    // TODO: handle errors and show appropriate alert dialog

    print(signUpStore.state);
  }

  void _isButtonActivated() {
    if (mounted) {
      setState(() {
        _isSignButtonActivated = signUpForms.isValid();
      });
    }
  }

  @override
  void dispose() {
    signUpForms.disposeControllers();
    super.dispose();
  }
}