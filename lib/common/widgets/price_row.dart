import 'package:flutter/material.dart';
import 'package:mobile/common/widgets/width_gap.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/text_styles.dart';
import 'package:mobile/l10n/app_localizations_extension.dart';

class PriceRow extends StatelessWidget {
  final String title;
  final bool inclVat;
  final String priceWithUnit;
  const PriceRow(
      {super.key,
      required this.inclVat,
      required this.priceWithUnit,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            title,
            style:
                AppStyles.medium14.copyWith(color: AppColors.inputLabelColor),
          ),
          Spacer(),
          (inclVat == true)
              ? Text(
                  "(${context.appStrings.inclusiveVat})",
                  style: AppStyles.regular12
                      .copyWith(color: AppColors.inputLabelColor),
                )
              : SizedBox.shrink(),
          WidthGap(width: 2),
          Text(
            priceWithUnit,
            style:
                AppStyles.heading5.copyWith(color: AppColors.inputLabelColor),
          )
        ],
      ),
    );
  }
}
