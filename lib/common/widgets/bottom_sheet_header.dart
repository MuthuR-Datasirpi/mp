import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/build_context.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/dimens.dart';

class BottomSheetHeader extends StatelessWidget {
  const BottomSheetHeader({
    Key? key,
    this.title,
    this.onClosePressed,
  }) : super(key: key);

  final String? title;
  final VoidCallback? onClosePressed;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Padding(
        padding: const EdgeInsets.only(
            top: Dimensions.padding_8,
            left: Dimensions.materialPadding,
            right: Dimensions.materialPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DecoratedBox(
                decoration: const ShapeDecoration(
                  color: AppColors.backgroundColor,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                    onPressed: onClosePressed,
                    icon: const Icon(Icons.close,
                        color: AppColors.gray4Color))),
            Text(title ?? '', style: context.textTheme.titleMedium),
            const SizedBox(width: 34)
          ],
        ),
      ),
      Divider(thickness: 1.5, color: AppColors.separatorColor)
    ]);
  }
}
