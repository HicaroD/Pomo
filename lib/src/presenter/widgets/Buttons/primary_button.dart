import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pomo_app/src/presenter/widgets/Text/custom_text.dart';
import 'package:pomo_app/src/presenter/widgets/Text/font_family.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback callback;
  final String hintText;

  const PrimaryButton({
    Key? key,
    required this.callback,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      child: CustomText(
        hintText,
        fontFamily: FontFamily.montserrat,
      ),
    );
  }
}
