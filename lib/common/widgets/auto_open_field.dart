import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/build_context.dart';
import 'package:mobile/core/resources/resources.dart';

// Custom Input Widget that extends StatefulWidget
class AutoOpenField extends StatefulWidget {
  // Callback function to be executed when the Input is on changed
  final void Function(String) onChanged;
  final FocusNode focusNode;

  // The Height of the Input
  final double height;

  // Input label
  final String label;

  // Input controller
  final TextEditingController? controller;

  // Constructor to initialize the AutoOpenField widget with required parameters
  const AutoOpenField({
    Key? key,
    required this.label,
    required this.onChanged,
    this.height = 60,
    required this.focusNode,
    this.controller,
  }) : super(key: key);

  // Creating a state for the AutoOpenField widget
  @override
  State<AutoOpenField> createState() => _AutoOpenFieldState();
}

// State class for the AutoOpenField widget
class _AutoOpenFieldState extends State<AutoOpenField> {
  // Input focus node
  bool isFocusedInput = false;

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
        autofocus: true,
        controller: widget.controller,
        focusNode: widget.focusNode,
        style: context.textTheme.labelMedium?.copyWith(
          color: AppColors.inputValueColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 20),
          labelText: widget.label,
          // Set the label text
          labelStyle: context.textTheme.labelMedium?.copyWith(
            color: AppColors.inputLabelColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          floatingLabelStyle: context.textTheme.labelMedium?.copyWith(
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
        // On Changed Event
        onChanged: widget.onChanged,
      ),
    );
  }
}
