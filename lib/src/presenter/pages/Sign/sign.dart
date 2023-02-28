import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../utils/colors.dart';
import '../../bloc/sign_bloc/sign_bloc.dart';
import 'components/sign_page_body.dart';
import 'components/sign_header.dart';

class SignPage extends StatelessWidget {
  const SignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocProvider(
        create: (_) => Modular.get<SignBloc>(),
        child: Container(
          color: PomoColors.PRIMARY_RED,
          child: Column(
            children: <Widget>[
              const Expanded(
                child: SignPageHeader(),
              ),
              Expanded(
                flex: 3,
                child: SignPageBody(screenSize: screenSize),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
