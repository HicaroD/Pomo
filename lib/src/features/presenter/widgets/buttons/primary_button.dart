import 'package:flutter/material.dart';
import '../../../../utils/colors.dart';
import '../text/custom_text.dart';
import '../text/font_family.dart';

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
            shadowColor: Colors.transparent,
            disabledBackgroundColor: PomoColors.SECONDARY_RED,
            backgroundColor: PomoColors.SECONDARY_GREY.withOpacity(0.12),
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
