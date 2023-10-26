import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/build_context.dart';
import 'package:mobile/core/resources/resources.dart';

// Custom Input Widget that extends StatefulWidget
class AppInput extends StatefulWidget {
  // Callback function to be executed when the Input is on changed
  final void Function(String) onChanged;

  // The Height of the Input
  final double height;

  // Input label
  final String label;

  // Input controller
  final TextEditingController? controller;

  // Boolean for auto focus
  final bool autofocus;

  // Input prefix section
  final Widget? prefix;

  final TextInputType? keyboardType;

  final int? maxLength;

  // Constructor to initialize the AppInput widget with required parameters
  const AppInput(
      {Key? key,
      required this.label,
      required this.onChanged,
      this.height = 60,
      this.controller,
      this.autofocus = false,
      this.prefix,
      this.maxLength,
      this.keyboardType = TextInputType.text})
      : super(key: key);

  // Creating a state for the AppInput widget
  @override
  State<AppInput> createState() => _AppInputState();
}

// State class for the AppInput widget
class _AppInputState extends State<AppInput> {
  // Input focus node
  final FocusNode _inputFocusNode = FocusNode();
  bool isFocusedInput = false;

  @override
  void initState() {
    super.initState();
    // Input focus node listener
    _inputFocusNode.addListener(() {
      if (_inputFocusNode.hasFocus) {
        setState(() {
          isFocusedInput = true;
        });
      } else {
        // Text field has lost focus
        setState(() {
          isFocusedInput = false;
        });
      }
    });
  }

  @override
  void dispose() {
    // Input focus node dispose
    _inputFocusNode.dispose();
    super.dispose();
  }

  // Build method to define how the Input widget should be displayed
  @override
  Widget build(BuildContext context) {
    // Returns a Container widget that acts as the parent for the Input
    return Container(
      padding: const EdgeInsets.only(left: 14, right: 14, top: 16, bottom: 14),
      decoration: ShapeDecoration(
        color: AppColors.inputFillColor,
        shape: RoundedRectangleBorder(
          side: isFocusedInput
              ? BorderSide(width: 2, color: AppColors.primaryColor)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      width: double.infinity,
      // 100% width
      height: widget.height,
      // Input Widget
      child: TextField(
        keyboardType: widget.keyboardType,
        autofocus: widget.autofocus,
        controller: widget.controller,
        focusNode: _inputFocusNode,
        style: context.textTheme.titleSmall?.copyWith(
          color: AppColors.inputValueColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          counter: const Offstage(),
          prefix: widget.prefix != null &&
                  (isFocusedInput || widget.controller!.text.isNotEmpty)
              ? widget.prefix
              : null,
          contentPadding: const EdgeInsets.only(top: 20),
          labelText: widget.label,
          labelStyle: context.textTheme.labelLarge?.copyWith(
            color: AppColors.inputValueColor,
            fontWeight: FontWeight.w500,
          ),
          floatingLabelStyle: context.textTheme.labelLarge?.copyWith(
            color: AppColors.inputLabelColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          fillColor: AppColors.inputFillColor,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
        maxLength: widget.maxLength,
        onChanged: widget.onChanged,
      ),
    );
  }
}
