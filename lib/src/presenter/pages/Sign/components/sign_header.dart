import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../widgets/text/custom_text.dart';
import '../../../widgets/text/font_family.dart';

class SignPageHeader extends StatelessWidget {
  const SignPageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SvgPicture.asset("assets/tomato.svg"),
        const SizedBox(width: 15),
        const CustomText(
          "Pomo",
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily: FontFamily.montserrat,
        ),
      ],
    );
  }
}
