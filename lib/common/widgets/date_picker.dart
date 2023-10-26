import 'package:flutter/material.dart';
import 'package:mobile/common/widgets/height_gap.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/text_styles.dart';

class DatePicker extends StatelessWidget {
  final String title;
  const DatePicker({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.heading5.copyWith(color: AppColors.primaryBlack),
        ),
        HeightGap(height: 16),
        Container(
          height: 50,
          decoration: BoxDecoration(color: AppColors.citySearchBarBgColor),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.0, vertical: 0),
            child: Row(
              children: [
                Text(
                  "Select date",
                  style: AppStyles.heading5
                      .copyWith(color: AppColors.primaryBlack),
                ),
                Spacer(),
                Image.asset(
                  "assets/images/calendar.png",
                  width: 22,
                  height: 22,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
