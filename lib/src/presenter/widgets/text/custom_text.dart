import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';
import 'font_family.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontFamily? fontFamily;

  const CustomText(
    this.text, {
    Key? key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.getFont(
        _getFontFamily(),
        fontSize: fontSize ?? 12.0,
        fontWeight: fontWeight ?? FontWeight.normal,
        textStyle: TextStyle(
          color: color ?? PomoColors.PRIMARY_WHITE,
        ),
      ),
    );
  }

  String _getFontFamily() {
    if (fontFamily == null) return "Roboto";

    switch (fontFamily) {
      case FontFamily.roboto:
        return "Roboto";
      case FontFamily.montserrat:
        return "Montserrat";
      default:
        return "";
    }
  }
}
