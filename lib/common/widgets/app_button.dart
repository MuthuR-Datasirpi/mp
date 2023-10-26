import 'package:flutter/material.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/common/widgets/app_loading_indicator.dart';

// Custom Button Widget that extends StatefulWidget
class AppButton extends StatefulWidget {
  // Callback function to be executed when the button is pressed
  final VoidCallback? onPressed;

  // The widget to be displayed as the body of the button
  final Widget body;

  // The background color of the button
  final Color bgColor;

  // The boolean for show the loading indicator
  final bool isLoading;

  // The Height of the button
  final double height;

  final Color disabledBgColor;

  // Constructor to initialize the AppButton widget with required parameters
  const AppButton(
      {Key? key,
      required this.onPressed,
      required this.bgColor,
      required this.body,
      this.isLoading = false,
      this.height = 40,
      this.disabledBgColor = AppColors.btnDisableColor})
      : super(key: key);

  // Creating a state for the AppButton widget
  @override
  State<AppButton> createState() => _AppButtonState();
}

// State class for the AppButton widget
class _AppButtonState extends State<AppButton> {
  // Button border radius
  final double btnBorderRadius = 8;

  // Build method to define how the button widget should be displayed
  @override
  Widget build(BuildContext context) {
    // Returns a Container widget that acts as the parent for the button
    return Container(
      width: double.infinity, // 100% width
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(btnBorderRadius),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          surfaceTintColor: Colors.white,
          backgroundColor: widget.bgColor,
          disabledBackgroundColor: widget.disabledBgColor,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: AppColors.btnBorderColor,
            ),
            borderRadius: BorderRadius.circular(btnBorderRadius),
          ),
        ),
        onPressed: widget.isLoading ? null : widget.onPressed,
        child: widget.isLoading ? const AppLoadingIndicator() : widget.body,
      ),
    );
  }
}
