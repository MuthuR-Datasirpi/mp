import 'package:flutter/material.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/dimens.dart';

import 'primary_button.dart';
//ignore: must_be_immutable
class CommonActionBar extends StatelessWidget {
  CommonActionBar.basic({
    super.key,
    required String label,
    required VoidCallback? action,
    this.padding,
  })  : _basic = true,
        primaryLabel = label,
        primaryAction = action,
        assert(label.isNotEmpty, "Label must be a non-empty String");
  CommonActionBar.secondary(
      {super.key,
      required this.primaryLabel,
      required this.primaryAction,
      required this.secondaryLabel,
      required this.secondaryAction,
      this.padding})
      : _basic = false,
        assert(primaryLabel != null && primaryLabel.isNotEmpty,
            "Primary Label must be a non-empty String"),
        assert(secondaryLabel != null && secondaryLabel.isNotEmpty,
            "Secondary Label must be a non-empty String");
  final bool _basic;
  String? primaryLabel;
  VoidCallback? primaryAction;
  String? secondaryLabel;
  VoidCallback? secondaryAction;
  EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.separatorColor,
          ),
        ),
      ),
      padding: padding ?? const EdgeInsets.all(Dimensions.materialPadding),
      child: _basic
          ? PrimaryButton(
              buttonSize: const Size.fromHeight(55),
              label: primaryLabel!,
              onPressed: primaryAction)
          : Row(
              children: [
                Flexible(
                  child: PrimaryButton(
                    outlined: true,
                    label: secondaryLabel!,
                    onPressed: secondaryAction,
                    borderColor: AppColors.primaryColor,
                    textColor: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(width: 16),
                Flexible(
                    child: PrimaryButton(
                        label: primaryLabel!, onPressed: primaryAction)),
              ],
            ),
    );
  }
}
