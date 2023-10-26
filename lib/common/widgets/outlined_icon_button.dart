import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/build_context.dart';
import 'package:mobile/core/resources/colors.dart';

class OutlinedIconButton extends StatelessWidget {
  const OutlinedIconButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.zero,
        foregroundColor: AppColors.primaryColor,
        minimumSize: const Size.fromHeight(40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        side: BorderSide(
          color: AppColors.coreGrayColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: Colors.black),
            Text(
              label,
              style: context.textTheme.titleMedium?.copyWith(
                color: AppColors.textColorBlack,
                fontWeight: FontWeight.w600,
              ),
            ),
            Icon(icon, color: Colors.transparent),
          ],
        ),
      ),
    );
  }
}
