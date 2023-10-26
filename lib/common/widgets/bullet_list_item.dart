import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/build_context.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/constants/res.dart';
import 'package:mobile/common/widgets/width_gap.dart';

class BulletListItem extends StatelessWidget {
  final String title;

  const BulletListItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('\u2022',
            style: context.textTheme.titleSmall
                ?.copyWith(color: AppColors.inputLabelColor)),
        WidthGap(width: sizes.widthRatio! * 6),
        Expanded(
          child: Text(
            title,
            style: context.textTheme.titleSmall
                ?.copyWith(color: AppColors.inputLabelColor),
          ),
        ),
      ],
    );
  }
}
