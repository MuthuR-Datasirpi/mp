import 'package:flutter/material.dart';
import 'package:mobile/common/widgets/width_gap.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/text_styles.dart';

class CustomRadioList extends StatefulWidget {
  final String headertext;
  final List<String> titles;
  final Color selectedBackgroundColor;
  final Color unselectedBackgroundColor;
  final Color selectedborderColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;
  final Color unselectedborderColor;
  final Function(String) onItemSelected;

  CustomRadioList(
      {required this.headertext,
      required this.titles,
      required this.selectedBackgroundColor,
      required this.unselectedBackgroundColor,
      required this.selectedborderColor,
      required this.selectedTextColor,
      required this.unselectedTextColor,
      required this.unselectedborderColor,
      required this.onItemSelected});

  @override
  _CustomRadioListState createState() => _CustomRadioListState();
}

class _CustomRadioListState extends State<CustomRadioList> {
  int _selectedIdx = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.headertext,
          style: AppStyles.heading5.copyWith(color: AppColors.primaryBlack),
        ),
        Column(
          children: List.generate(widget.titles.length, (index) {
            final title = widget.titles[index];
            final isSelected = index == _selectedIdx;

            return Padding(
              padding: EdgeInsets.only(top: 16),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _selectedIdx = index;
                  });
                  widget.onItemSelected(index.toString());
                },
                child: Container(
                  height: 51,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? widget.selectedBackgroundColor
                        : widget.unselectedBackgroundColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected
                          ? widget.selectedborderColor
                          : widget.unselectedborderColor,
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      WidthGap(width: 14),
                      Container(
                        width: 24.0,
                        height: 24.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.blackBorder,
                          ),
                        ),
                        child: isSelected
                            ? Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.selectedRatio
                                      // Green inner circle when selected

                                      ),
                                ),
                              )
                            : null,
                      ),
                      WidthGap(width: 10),
                      Text(
                        title,
                        style: AppStyles.medium14
                            .copyWith(color: AppColors.primaryBlack),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
