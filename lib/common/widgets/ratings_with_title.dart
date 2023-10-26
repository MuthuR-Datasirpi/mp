import 'package:flutter/material.dart';
import 'package:mobile/common/widgets/width_gap.dart';
import 'package:mobile/core/extensions/build_context.dart';
import 'package:mobile/core/resources/resources.dart';
import 'package:mobile/core/resources/text_styles.dart';


class RatingWithTitle extends StatelessWidget {
  final String title;
  final String ratings;
  const RatingWithTitle(
      {super.key, required this.title, required this.ratings});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            title,
            style: context.textTheme.headlineMedium
          ),
          Spacer(),
          Icon(
            Icons.star,
            color: AppColors.startYellowColor,
          ),
          WidthGap(width: 5),
          Text(
            ratings,
            style: AppStyles. heading5.copyWith(color: AppColors.inputLabelColor),
          )
        ],
      ),
    );
  }
}
