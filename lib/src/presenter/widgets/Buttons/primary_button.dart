import 'package:flutter/material.dart';
import 'package:pomo_app/src/utils/colors.dart';
import '../Text/custom_text.dart';
import '../Text/font_family.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;

  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: SizedBox(
        width: width ?? 30,
        height: height ?? 50,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: PomoColors.SECONDARY_RED,
            shadowColor: Colors.transparent,
          ),
          child: CustomText(
            text,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            fontFamily: FontFamily.montserrat,
          ),
        ),
      ),
    );
  }
}
