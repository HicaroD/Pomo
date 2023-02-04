import 'package:flutter/material.dart';

import 'components/sign_page_body.dart';
import 'components/sign_header.dart';
import '../../../../utils/colors.dart';

class SignPage extends StatelessWidget {
  const SignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
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
    );
  }
}
