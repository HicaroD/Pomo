import 'package:flutter/material.dart';
import '../Text/custom_text.dart';
import '../Text/font_family.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.text,
    this.activated = false,
    this.onPressed,
  }) : super(key: key);

  final bool activated;
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: activated ? onPressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
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
