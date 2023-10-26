import 'package:flutter/material.dart';
import 'package:mobile/common/widgets/bullet_list_item.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/text_styles.dart';

class CustomExpandableTile extends StatefulWidget {
  final String title;
  final List<String> items;

  CustomExpandableTile({required this.title, required this.items});

  @override
  State<CustomExpandableTile> createState() => _CustomExpandableTileState();
}

class _CustomExpandableTileState extends State<CustomExpandableTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
          ),
          child: ListTile(
            title: Row(
              children: [
                Text(
                  widget.title,
                  style: AppStyles.heading4
                      .copyWith(color: AppColors.primaryBlack),
                ),
                Spacer(),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                ),
              ],
            ),
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            contentPadding: EdgeInsets.all(0),
          ),
        ),
        if (isExpanded)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.items.map((item) {
              return BulletListItem(title: item);
            }).toList(),
          ),
      ],
    );
  }
}
