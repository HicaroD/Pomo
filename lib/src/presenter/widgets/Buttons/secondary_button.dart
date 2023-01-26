import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../Text/custom_text.dart';
import '../Text/font_family.dart';

class SecondaryButton extends StatelessWidget {
  final String labelText;
  final double? labelSize;
  final FontWeight? labelFontWeight;
  final FontFamily? labelFontFamily;
  final bool hasBottomBorder;
  final VoidCallback onPressed;

  const SecondaryButton(
    this.labelText, {
    Key? key,
    required this.onPressed,
    this.labelSize,
    this.labelFontWeight,
    this.labelFontFamily,
    this.hasBottomBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: hasBottomBorder
          ? const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: PomoColors.PRIMARY_WHITE,
                  width: 2,
                ),
              ),
            )
          : null,
      child: TextButton(
        onPressed: onPressed,
        child: CustomText(
          labelText,
          fontSize: labelSize ?? 18,
          fontFamily: labelFontFamily ?? FontFamily.montserrat,
          fontWeight: labelFontWeight ?? FontWeight.bold,
        ),
      ),
    );
  }
}
