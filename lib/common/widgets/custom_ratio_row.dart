import 'package:flutter/material.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/text_styles.dart';

class CustomRadioRow extends StatefulWidget {
  final String headertext;
  final List<String> titles;
  final Color selectedBackgroundColor;
  final Color unselectedBackgroundColor;
  final Color selectedborderColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;
  final Color unselectedborderColor;
  final Function(String) onItemSelected;

  CustomRadioRow(
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
  _CustomRadioRowState createState() => _CustomRadioRowState();
}

class _CustomRadioRowState extends State<CustomRadioRow> {
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
        Wrap(
          children: List.generate(widget.titles.length, (index) {
            final title = widget.titles[index];
            final isSelected = index == _selectedIdx;

            return Padding(
              padding: EdgeInsets.only(top: 16, right: 6),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _selectedIdx = index;
                  });
                  widget.onItemSelected(index.toString());
                },
                child: Container(
                  height: 51,
                  width: 100,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
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
