import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/build_context.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/dimens.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/sample_menu_response.dart';
import 'package:mobile/l10n/app_localizations_extension.dart';

class SampleMenuDaysWidget extends StatefulWidget {
  const SampleMenuDaysWidget({Key? key, required this.onTap}) : super(key: key);

  final Function(Weekday day) onTap;

  @override
  State<SampleMenuDaysWidget> createState() => _SampleMenuDaysWidgetState();
}

class _SampleMenuDaysWidgetState extends State<SampleMenuDaysWidget> {
  final weekdays = [
    Weekday(1, Weekdays.Monday),
    Weekday(2, Weekdays.Tuesday),
    Weekday(3, Weekdays.Wednesday),
    Weekday(4, Weekdays.Thursday),
    Weekday(5, Weekdays.Friday),
    Weekday(6, Weekdays.Saturday),
    Weekday(7, Weekdays.Sunday)
  ];

  int selectedDay = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...weekdays
              .map((day) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDay = day.id;
                      });
                      widget.onTap.call(day);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.padding_8),
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                            color: selectedDay == day.id
                                ? AppColors.secondaryColor
                                : AppColors.backGroundGreen,
                            borderRadius: BorderRadius.circular(3.65)),
                        child: Center(
                          child: Text(
                            '${context.appStrings.day} ${day.id}',
                            style: context.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 11,
                                color: selectedDay == day.id
                                    ? AppColors.textColorWhite
                                    : AppColors.textColorBlack),
                          ),
                        ),
                      ),
                    ),
                  ))
              .toList()
        ],
      ),
    );
  }
}
