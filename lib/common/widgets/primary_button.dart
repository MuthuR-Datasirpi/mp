import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/build_context.dart';
import 'package:mobile/core/resources/colors.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Size? buttonSize;
  final Color? backgroundColor;
  final Widget? icon;
  final bool outlined;
  final Color? textColor;
  final Color? borderColor;
  final TextStyle? textStyle;

  const PrimaryButton({
    super.key,
    this.icon,
    this.buttonSize = const Size.fromHeight(48),
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.textStyle,
    this.outlined = false,
    required this.label,
    required this.onPressed,
  });

  const PrimaryButton.small({
    super.key,
    this.buttonSize,
    required this.label,
    this.backgroundColor,
    this.icon,
    this.textColor,
    this.outlined = false,
    this.textStyle,
    this.borderColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        icon: icon ?? const SizedBox.shrink(),
        onPressed: onPressed != null
            ? () {
                if (onPressed != null) {
                  ///To hide soft keyboard on button click if open
                  hideSoftKeyboardIfOpen(context);
                  onPressed!();
                }
              }
            : null,
        style: outlined
            ? OutlinedButton.styleFrom(
                elevation: 0,
                backgroundColor: backgroundColor ?? Colors.white,
                foregroundColor: textColor ?? AppColors.accentColor,
                shadowColor: Colors.transparent,
                side: BorderSide(color: borderColor ?? AppColors.coreGrayColor),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                minimumSize: buttonSize)
            : ElevatedButton.styleFrom(
                backgroundColor: backgroundColor ?? AppColors.accentColor,
                foregroundColor: textColor ?? Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                minimumSize: buttonSize),
        label: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
            child: Text(label,
                style: textStyle ??
                    context.textTheme.titleMedium?.copyWith(
                        color: AppColors.textColorWhite,
                        fontWeight: FontWeight.w500))));
  }

  void hideSoftKeyboardIfOpen(BuildContext context) {
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
  }
}
