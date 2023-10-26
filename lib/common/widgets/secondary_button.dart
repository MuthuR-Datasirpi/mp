import 'package:flutter/material.dart';
import 'package:mobile/core/resources/text_styles.dart';


class SecondaryButton extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final String text;
  final double width;
  final Function()? onPressed;

  SecondaryButton({
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.text,
    required this.width,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(color: borderColor,width: 2),
            ),
          ),
        ),
        child: Text(
          text,
          style: AppStyles. heading5.copyWith(color: textColor),
        ),
      ),
    );
  }
}
